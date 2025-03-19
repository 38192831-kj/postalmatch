from persistence.database import dbcursor


class BaseDAO():
    def __init__(self, table_name, pkey='id'):
        self.table_name = table_name
        self.pkey = pkey

    def get(self) -> list[dict]:
        results = []

        with dbcursor() as cursor:
            query = (f"SELECT * "
                     f"FROM {self.table_name}")
            cursor.execute(query)
            results = cursor.fetchall()

        return results

    def find(self, pkey) -> dict | list[dict]:
        result = {}

        with dbcursor() as cursor:
            query = (f"SELECT * "
                     f"FROM {self.table_name} "
                     f"WHERE {self.pkey} == {pkey}")
            cursor.execute(query)
            result = cursor.fetchall()

        return result
