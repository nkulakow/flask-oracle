import cx_Oracle
import hashlib
from database_classes.Employee import Employee as db_employee
import utilities
import resources.constants as const
from typing import List, Tuple
import database_classes.Table as Table
from datetime import datetime


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


    def gen_next_id(self, table: Table.Table) -> int:
        id_position_in_table = table.get_id_position()
        query = f"SELECT max({table.get_columns()[id_position_in_table]}) FROM {table.get_name()}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        id = cursor.fetchall()[0][0]
        cursor.close()
        connection.close()
        return id + 1


    def get_all_pracownicy(self):
        connection, cursor = self.connect_to_db()
        try:
            cursor.execute("SELECT p.* FROM pracownik p JOIN stanowisko s ON p.id_stanowiska = s.id_stanowiska WHERE s.kadrowy = 0")
            rows = cursor.fetchall()
            cursor.close()
        except cx_Oracle.Error:
            return f"Error"
        finally:
            connection.close()
            return rows


    def insert_into_table(self, table: Table.Table, data: List[str]) -> None:
        query = utilities.make_insert_statement(table, data)
        connection, cursor = self.connect_to_db()
        try:
            cursor.execute(query)
            cursor.close()
        except cx_Oracle.Error:
            print("Could not execute insert operation.")
        finally:
            self.commit_and_close(connection)

    def delete_from_table(self, table: Table.Table, id: int) -> None:
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
            query = "SELECT p.id_pracownika, d.login, d.skrot FROM dane_logowania d join pracownik_logowanie p ON d.id_loginu = p.id_loginu WHERE d.login like :login"
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
        
    
    def is_user_staff(self) -> bool:
        query = f"SELECT s.kadrowy FROM pracownik p JOIN stanowisko s ON s.id_stanowiska = p.id_stanowiska WHERE p.id_pracownika = {self.user_id}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        is_cadre = cursor.fetchall()[0][0]
        cursor.close()
        connection.close()
        return is_cadre == 1
    
    
    def get_user_data(self) -> list:
        def default_data() -> list:
            return ["imie", "nazwisko", "pesel", "email służbowy"]
        
        if not self.user_id:
            return default_data()
        
        query = f"SELECT imie, nazwisko, pesel, email FROM pracownik WHERE id_pracownika = {self.user_id}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        rows = cursor.fetchall()
        cursor.close()
        connection.close()
        return rows[0]
    

    def save_user_data(self, new_values) -> None:
        IDX_NAME = 0
        IDX_SURNAME = 1
        IDX_PESEL = 2
        IDX_MAIL = 3
        query = f"UPDATE pracownik SET imie = '{new_values[IDX_NAME]}', nazwisko = '{new_values[IDX_SURNAME]}', pesel = '{new_values[IDX_PESEL]}', email = '{new_values[IDX_MAIL]}' WHERE id_pracownika = {self.user_id}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        cursor.close()
        self.commit_and_close(connection)

    
    def get_user_contact_data(self) -> list:
        def default_data() -> list:
            return ["nr telefonu", "fax", "mail"]
        
        def check_for_empty_slots(data) -> None:
            for i in range(len(data)):
                if data[i] is None:
                    data[i] = ''
            return data
        
        if not self.user_id:
            return default_data()
        
        query = f"SELECT nr_telefonu, fax, email_prywatny FROM dane_kontaktowe WHERE id_pracownika = {self.user_id}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        rows = cursor.fetchall()
        cursor.close()
        connection.close()
        return check_for_empty_slots(list(rows[0]))
    

    def save_user_contact_data(self, new_values) -> None:
        def check_for_empty_slots(data) -> None:
            for i in range(len(data)):
                if not data[i]:
                    data[i] = 'NULL'
                else:
                    data[i] = f"'{data[i]}'"
        
        IDX_PHONE = 0
        IDX_FAX = 1
        IDX_MAIL = 2
        check_for_empty_slots(new_values)
        query = f"UPDATE dane_kontaktowe SET nr_telefonu = {new_values[IDX_PHONE]}, fax = {new_values[IDX_FAX]}, email_prywatny = {new_values[IDX_MAIL]} WHERE id_pracownika = {self.user_id}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        cursor.close()
        self.commit_and_close(connection)


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
    

    def get_all_bonuses(self) -> List[Tuple[str, str]]:
        query_cars = f"SELECT id_benefitu, marka, model FROM samochod WHERE id_pracownika is NULL"
        query_electronical = f"SELECT id_benefitu, nazwa, marka, model FROM urzadzenie_elektroniczne WHERE id_pracownika is NULL"
        query_other = f"SELECT id_benefitu, nazwa, krotki_opis FROM inny_benefit WHERE id_pracownika is NULL"

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
    

    def get_all_applications(self, id) -> List[Tuple[str, str]]:
        query_bonus = f"SELECT id_wniosku FROM wniosek_bonus WHERE id_pracownika = {id} AND status NOT LIKE 'zaakceptowany'"
        query_holiday = f"SELECT id_wniosku, rodzaj FROM wniosek_urlop WHERE id_pracownika = {id} AND status NOT LIKE 'zaakceptowany'"
        query_other = f"SELECT id_wniosku, krotki_opis FROM wniosek_inny WHERE id_pracownika = {id} AND status NOT LIKE 'zaakceptowany'"

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


    def get_all_certificates(self) -> List[Tuple[str, str]]:
        query = f"SELECT id_certyfikatu, nazwa, krotki_opis FROM certyfikat"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        rows = cursor.fetchall()
        cursor.close()
        connection.close()
        return utilities.make_pretty_certificates_strings(rows)
    

    def get_user_bonus_applications(self) -> list:
        query = f"SELECT id_wniosku, data_zlozenia, nazwa_zalacznika, status, stawka, czy_jednorazowy FROM wniosek_bonus WHERE id_pracownika = {self.user_id}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        rows = utilities.transform_to_string(cursor.fetchall())
        cursor.close()
        connection.close()
        return rows
    

    def get_user_holiday_applications(self) -> list:
        query = f"SELECT id_wniosku, data_zlozenia, nazwa_zalacznika, status, data_rozpoczecia, data_zakonczenia, rodzaj FROM wniosek_urlop WHERE id_pracownika = {self.user_id}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        rows = utilities.transform_to_string(cursor.fetchall())
        cursor.close()
        connection.close()
        return rows
    

    def get_user_other_applications(self) -> list:
        query = f"SELECT id_wniosku, data_zlozenia, nazwa_zalacznika, status, krotki_opis FROM wniosek_inny WHERE id_pracownika = {self.user_id}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        rows = utilities.transform_to_string(cursor.fetchall())
        cursor.close()
        connection.close()
        return rows


    def give_benefit(self, employee_id, benefit_id, date) -> None:
        connection, cursor = self.connect_to_db()
        parameters = [int(employee_id), int(benefit_id), datetime.strptime(date,'%Y-%m-%d')]
        cursor.callproc('przypisz_benefit', parameters)
        cursor.close()
        self.commit_and_close(connection)


    def change_application_status(self, application_id, new_status) -> None:
        status_approved = "1"
        status = "zaakceptowany" if new_status == status_approved else "odrzucony"
        query = f"UPDATE wniosek_t SET status = '{status}' WHERE id_wniosku = {application_id}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        cursor.close()
        self.commit_and_close(connection)


    def assign_to_team(self, employee_id, team_id) -> None:
        def is_already_in_team(employee_id, team_id) -> bool:
            query = f"SELECT COUNT(*) FROM zespol_pracownik WHERE id_pracownika = {employee_id} AND id_zespolu = {team_id}"
            connection, cursor = self.connect_to_db()
            cursor.execute(query)
            count = cursor.fetchall()[0][0]
            cursor.close()
            connection.close()
            return count > 0

        if is_already_in_team(employee_id, team_id):
            return
        
        query = f"INSERT INTO zespol_pracownik VALUES ({employee_id}, {team_id})"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        cursor.close()
        self.commit_and_close(connection)


    def make_leader(self, employee_id, team_id) -> None:
        query = f"UPDATE zespol SET id_lidera = {employee_id} WHERE id_zespolu = {team_id}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        cursor.close()
        self.commit_and_close(connection)


    def change_position(self, employee_id, position_id) -> None:
        query = f"UPDATE pracownik SET id_stanowiska = {position_id} WHERE id_pracownika = {employee_id}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        cursor.close()
        self.commit_and_close(connection)


    def block_employee(self, employee_id) -> None:
        query = f"UPDATE pracownik SET zablokowany = 1 WHERE id_pracownika = {employee_id}"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        cursor.close()
        self.commit_and_close(connection)


    def assign_certificate(self, certiicate_id, date_recieved) -> None:
        query = f"INSERT INTO certyfikat_pracownik VALUES ({certiicate_id}, {self.gen_next_id(Table.TABLE_CERTIFICATE_EMPLOYEE)}, TO_DATE('{date_recieved}', 'YYYY/MM/DD'), {self.user_id})"
        connection, cursor = self.connect_to_db()
        cursor.execute(query)
        cursor.close()
        self.commit_and_close(connection)


    def apply_for_holiday(self, data: list) -> None:
        id, date_applied, status, emp_id, date_begin, date_end, type = data
        self.insert_into_table(Table.TABLE_APPLICATION, )