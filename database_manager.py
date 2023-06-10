import cx_Oracle
import hashlib
from database_classes.Employee import Employee as db_employee


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
        return connection


    def get_all_pracownicy(self):
        connection = self.connect_to_db()
        cursor = connection.cursor()
        try:
            cursor.execute("SELECT * FROM pracownik")
            rows = cursor.fetchall()

            cursor.close()
        except cx_Oracle.Error:
            return f"Error"
        finally:
            connection.close()
            return rows


    def add_employee(self, employee: db_employee) -> None:
        id = str(employee.id),
        name = employee.name,
        surname = employee.surname,
        street = employee.street,
        home_numb = str(employee.home_number),
        flat_numb = str(employee.flat_number) if employee.flat_number else "NULL",
        PESEL = employee.PESEL,
        email = employee.email
        is_blocked = "1" if is_blocked else "0",
        pos_id = str(employee.position_id),
        county_id = str(employee.county_id),
        town_id = str(employee.town_id)
        query = f"INSERT INTO pracownik VALUES ({id}, {name}, {surname}, {street}, {home_numb}, {flat_numb}, {PESEL}, {email}, {is_blocked}, {pos_id}, {county_id}, {town_id})"
        connection = self.connect_to_db()
        cursor = connection.cursor()
        try:
            cursor.execute(query)
            cursor.close()
        except cx_Oracle.Error:
            print("Could not add employee to database.")
        finally:
            connection.close()

    def delete_employee(self, employee: db_employee) -> None:
        connection = self.connect_to_db()
        cursor = connection.cursor()
        try:
            cursor.execute(f"DELETE FROM pracownik WHERE id_pracownika = {employee.id}")
            cursor.close()
        except cx_Oracle.Error:
            print("Could not delete employee from database.")
        finally:
            connection.close()


    def check_login(self, login: str, password: str) -> bool:
        connection = self.connect_to_db()
        cursor = connection.cursor()
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

