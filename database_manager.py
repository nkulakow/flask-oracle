import cx_Oracle
import hashlib
from database_classes.Employee import Employee as db_employee
import utilities
import resources.constants as const
from typing import List


class DatabaseManager:

    def __init__(self, username, password, service_name):
        self.username = username
        self.password = password
        self.service_name = service_name
        self.user_id = None

    def connect_to_db(self):
        host = '172.17.0.1'
        port = '1521'
        dsn = cx_Oracle.makedsn(host, port, service_name=self.service_name)
        connection = cx_Oracle.connect(self.username, self.password, dsn)
        return connection, connection.cursor()


    def get_all_pracownicy(self):
        connection, cursor = self.connect_to_db()
        try:
            cursor.execute("SELECT * FROM pracownik")
            rows = cursor.fetchall()
            cursor.close()
        except cx_Oracle.Error:
            return f"Error"
        finally:
            connection.close()
            return rows


    def insert_into_table(self, table_name: str, data: List[str]) -> None:
        query = utilities.make_insert_statement(table_name, data)
        connection, cursor = self.connect_to_db()
        try:
            cursor.execute(query)
            cursor.commit()
            cursor.close()
        except cx_Oracle.Error:
            print("Could not execute insert operation.")
        finally:
            connection.close()

    def delete_employee(self, employee: db_employee) -> None:
        connection, cursor = self.connect_to_db()
        try:
            cursor.execute(f"DELETE FROM pracownik WHERE id_pracownika = {employee.id}")
            cursor.close()
        except cx_Oracle.Error:
            print("Could not delete employee from database.")
        finally:
            connection.close()


    def check_login(self, login: str, password: str) -> bool:
        connection, cursor = self.connect_to_db()
        try:
            query = "SELECT * FROM dane_logowania WHERE login LIKE :login"
            cursor.execute(query, login=login)
            rows = cursor.fetchall()
            print("aaa", rows)
            cursor.close()
            connection.close()
            if len(rows) == 0:
                return False
            sha256_hash = hashlib.sha256()
            sha256_hash.update(password.encode('utf-8'))
            if sha256_hash.hexdigest() == rows[0][2]:
                self.user_id = rows[0][0]
                return True
            return False
        except cx_Oracle.Error as e:
            raise cx_Oracle.Error(e)

