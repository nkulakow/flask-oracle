import cx_Oracle
import hashlib
from database_classes.Employee import Employee as db_employee
import utilities
import resources.constants as const
from typing import List, Tuple
from database_classes.Table import Table


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
    

    def commit_and_close(self, connection):
        connection.commit()
        connection.close()


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


    def insert_into_table(self, table: Table, data: List[str]) -> None:
        query = utilities.make_insert_statement(table, data)
        connection, cursor = self.connect_to_db()
        try:
            print(query)
            cursor.execute(query)
            cursor.close()
        except cx_Oracle.Error:
            print("Could not execute insert operation.")
        finally:
            self.commit_and_close(connection)

    def delete_from_table(self, table: Table, id: int) -> None:
        query = utilities.make_delete_statement(table, id)
        connection, cursor = self.connect_to_db()
        try:
            cursor.execute(query)
            cursor.close()
        except cx_Oracle.Error:
            print("Could not delete from database.")
        finally:
            self.commit_and_close(connection)


    def check_login(self, login: str, password: str) -> bool:
        def get_rows():
            query = "SELECT * FROM dane_logowania WHERE login LIKE :login"
            connection, cursor = self.connect_to_db()
            cursor.execute(query, login=login)
            rows = cursor.fetchall()
            cursor.close()
            connection.close()
            return rows

        try:
            rows = get_rows()
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

    def get_all_positions(self) -> List[Tuple[str, str]]:
        query = f"SELECT * FROM {const.TABLE_NAME_POSITION}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        rows = cursor.fetchall()
        cursor.close()
        connection.close()
        return utilities.make_pretty_positions_strings(rows)
    

    def get_all_towns(self) ->List[Tuple[str, str]]:
        query = f"SELECT m.id_powiatu, m.id_miejscowosci, p.nazwa, m.nazwa FROM miejscowosc m JOIN powiat p ON m.id_powiatu = p.id_powiatu"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        rows = cursor.fetchall()
        cursor.close()
        connection.close()
        return utilities.make_pretty_towns_strings(rows)
    

    def get_all_teams(self) -> List[Tuple[str, str]]:
        query = f"SELECT id_zespolu, nazwa_projektu FROM zespol"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        rows = cursor.fetchall()
        cursor.close()
        connection.close()
        return utilities.make_pretty_teams_strings(rows)
    

    def get_all_bonuses(self):
        query_cars = f"SELECT id_benefitu, marka, model FROM samochod"
        query_electronical = f"SELECT id_benefitu, nazwa, marka, model FROM urzadzenie_elektroniczne"
        query_other = f"SELECT id_benefitu, nazwa, krotki_opis FROM inny_benefit"

        connection, cursor = self.connect_to_db()
        
        cursor.execute(query_cars)
        cars = cursor.fetchall()
        cursor.execute(query_electronical)
        electronical = cursor.fetchall()
        cursor.execute(query_other)
        other = cursor.fetchall()

        cursor.close()
        connection.close()
        return utilities.make_pretty_car_strings(cars) + utilities.make_pretty_electronical_devices_strings(electronical) + utilities.make_pretty_other_benefits_strings(other)
    

    def get_all_applications(self):
        query_bonus = f"SELECT id_wniosku FROM wniosek_bonus"
        query_holiday = f"SELECT id_wniosku, rodzaj FROM wniosek_urlop"
        query_other = f"SELECT id_wniosku, krotki_opis FROM wniosek_inny"

        connection, cursor = self.connect_to_db()
        
        cursor.execute(query_bonus)
        bonuses = cursor.fetchall()
        cursor.execute(query_holiday)
        holiday = cursor.fetchall()
        cursor.execute(query_other)
        other = cursor.fetchall()

        cursor.close()
        connection.close()
        return utilities.make_pretty_bonuses_application_strings(bonuses) + utilities.make_pretty_holiday_application_strings(holiday) + utilities.make_pretty_other_application_strings(other)
