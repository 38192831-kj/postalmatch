import json
import os


class Configuration():
    """Clase utilizada para obtener las configuraciones de la aplicación."""
    __dir__ = os.path.abspath('./configuration')
    """Directorio en donde se encuentra la configuración."""

    @staticmethod
    def get_config(config_file: str):
        config_file_path = os.path.join(Configuration.__dir__, config_file)
        if not os.path.exists(config_file_path):
            raise Exception(
                f"No se encontró el archivo de configuración {config_file}."
            )

        with open(config_file_path) as file:
            data = json.load(file)

        return data
