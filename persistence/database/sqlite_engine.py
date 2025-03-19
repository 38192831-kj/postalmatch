from typing import override
from sqlite3 import connect

from .engine import Engine


class SQLiteEngine(Engine):
    def __init__(self, database_filepath):
        self.__database_filepath = database_filepath
        self.__connection__ = None

    @staticmethod
    def dict_from_row(cursor, row):
        return {c[0]: row[i] for i, c in enumerate(cursor.description)}

    @override
    def get_cursor(self):
        if not self.__connection__:
            self.connect()

        return self.__connection__.cursor()

    @override
    def connect(self):
        self.__connection__ = connect(
            self.__database_filepath,
            check_same_thread=False
        )
        self.__connection__.row_factory = SQLiteEngine.dict_from_row

    @override
    def close(self):
        self.__connection__.close()
