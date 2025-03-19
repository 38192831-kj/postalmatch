import logging
import os

from argparse import ArgumentParser
from tempfile import TemporaryFile, TemporaryDirectory
from time import time
from zipfile import ZipFile

import requests
from bs4 import BeautifulSoup
from colorama import Fore

from configuration import Configuration
from persistence.database import dbcursor


def initialize():
    database_config = Configuration.get_config('database.json')
    if not os.path.exists(database_config["migrations"]):
        # Si el directorio no existe manda un error.
        raise FileNotFoundError(database_config["migrations"])

    for item in os.listdir(database_config["migrations"]):
        item_abspath = \
            os.path.abspath(os.path.join(
                database_config["migrations"],
                item
            ))

        if os.path.isfile(item_abspath):
            # Si la ruta corresponde a un archivo
            # se ejecuta el comando correspondiente.
            with open(item_abspath, encoding='utf-8') as sql_file:
                print(f'{Fore.GREEN}[#] Ejecutando {Fore.BLUE}'
                      f'{item}{Fore.RESET}')
                with dbcursor() as cursor:
                    cursor.executescript(''.join(sql_file.readlines()))


def update_database():
    sepomex_config = Configuration.get_config('sepomex.json')

    try:
        result = requests.get(sepomex_config.get('url'))
        html = BeautifulSoup(result.text, 'html.parser')
        form = html.find('form')

        data = {}

        for input in form.find_all('input'):
            input_name = input.get("name")
            input_val = input.get("value")
            if input_name is not None and input_val is not None:
                data[input_name] = input_val

        data = {**data, **sepomex_config.get('body', {})}

        print('[#] Descargando la última información de '
              'Códigos Postales de México')

        request = requests.post(
            sepomex_config.get('url'),
            data=data,
            headers=sepomex_config.get('headers')
        )

        request.raise_for_status()

        with TemporaryFile() as downloaded_file:
            for chunk in request.iter_content():
                downloaded_file.write(chunk)

            print('[#] Archivo descargado, extrayendo información...')
            with TemporaryDirectory() as tmpdir:
                with ZipFile(downloaded_file, 'r') as zipf:
                    zipf.extractall(tmpdir)

                file = open(f'{tmpdir}/{sepomex_config.get('filename')}')
                lines = file.readlines()
                file.close()

                with dbcursor() as cursor:
                    cursor.execute("delete from catalogue_postal_codes")
                    for line in lines[3:]:
                        if '|' in line:
                            line = line.replace('\n', '')
                            query = (
                                "insert into catalogue_postal_codes "
                                "values ('"
                                f"{"','".join(list(line.split('|')[:6]))}"
                                "')"
                            )

                            cursor.execute(query)

                    cursor.execute("commit")

    except Exception as error:
        logging.exception(error)


parser = ArgumentParser()
parser.add_argument('command')


commands = {
    'initialize': {
        'function': initialize,
        'args': []
    },
    'update_database': {
        'function': update_database,
        'args': []
    }
}
"""
Comandos para ejecutar
"""


if __name__ == '__main__':
    start_time = time()

    args = parser.parse_args()
    command_name = args.command.lower()

    if command_name in commands:
        command = commands.get(command_name)
        options = {}

        for a in command.get('args', []):
            # Se obtienen las opciones en base a
            # los argumentos que puede tener la función.
            value = dict(args._get_kwargs()).get(a)
            if value is not None:
                options[a] = value

        function = command.get('function')
        function(**options)
    else:
        # El comando ingresado no está registrado.
        raise NotImplementedError(f'El comando "{command_name}" no existe')

    print(f'{Fore.GREEN}[#] Terminado en {Fore.BLUE}'
          f'{round(time() - start_time, 2)}{Fore.RESET} segundos...')
