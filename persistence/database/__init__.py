from contextlib import contextmanager

from configuration import Configuration

from .engine import Engine
from .sqlite_engine import SQLiteEngine


database_config = Configuration.get_config('database.json')

DATABASE: Engine = SQLiteEngine(database_config.get('connection'))


@contextmanager
def dbcursor():
    try:
        cursor = DATABASE.get_cursor()
        yield cursor
    except Exception as error:
        raise error
