from flask import request
from typing import List, Tuple
import database_classes.Table as Table


def read_employee_data(id) -> List[str]:
    def split_addres_id(address: str) -> Tuple[str, str]:
        address = address[1:-1]
        return address.split(',')

    name = request.form['name']
    surname = request.form['surname']
    street = request.form['street']
    house_nr = request.form['house_nr']
    flat_nr = request.form['flat_nr']
    PESEL = request.form['pesel']
    email = request.form['mail']
    blocked = "0"
    position_id = request.form['position_id']
    county_id, town_id = split_addres_id(request.form['town_id']) # przez listę się coś psuje dlatego [1], trzeba zobaczyc
    return [
        f'{id}',
        f"'{name}'",
        f"'{surname}'",
        f"'{street}'",
        f"{house_nr}",
        f"{flat_nr}" if flat_nr else 'NULL',
        f"'{PESEL}'",
        f"'{email}'",
        f"{int(blocked)}",
        f"{position_id}",
        f"{county_id}",
        f"{town_id}"
        ]


def make_insert_statement(table: Table.Table, data: List[str]) -> str:
    query = f"INSERT INTO {table.get_name()} VALUES ("
    for piece in data:
        query += f"{piece}, "
    query = query[:-2] + ")"
    return query


def make_delete_statement(table: Table.Table, id: int) -> str:
    id_position_in_table = 0
    return f"DELETE FROM {table.get_name()} WHERE {table.get_columns()[id_position_in_table]} = {id}"


def make_pretty_positions_strings(data: list) -> List[Tuple[str, str]]:
    result = []
    for id, name, is_staff in data:
        name_is_staff = "kadrowy" if is_staff else "niekadrowy"
        result.append((str(id), f"{name}, {name_is_staff}"))
    return result


def make_pretty_towns_strings(data: list) -> List[Tuple[str, str]]:
    result = []
    for county_id, town_id, county_name, town_name in data:
        result.append((f"({county_id},{town_id})", f"{town_name}, pow. {county_name}"))
    return result


def make_pretty_teams_strings(data: list) -> List[Tuple[str, str]]:
    result = []
    for team_id, proj_name in data:
        result.append((team_id, f"Zespół {team_id}, projekt '{proj_name}'"))
    return result


def make_pretty_electronical_devices_strings(data: list):
    result = []
    for id, name, brand, model in data:
        result.append((id, f"Urządzenie {id} ({name}), {brand} {model}"))
    return result


def make_pretty_car_strings(data: list):
    result = []
    for id, brand, model in data:
        result.append((id, f"Samochód {id}, {brand} {model}"))
    return result


def make_pretty_other_benefits_strings(data: list):
    result = []
    for id, name, description in data:
        result.append((id, f"Benefit {id} ({name}); {description}"))
    return result


def make_pretty_bonuses_application_strings(data: list):
    result = []
    for id in data:
        result.append((id[0], f"Wniosek nr {id[0]} o przyznanie benefitu"))
    return result


def make_pretty_holiday_application_strings(data: list):
    result = []
    for id, type in data:
        result.append((id, f"Wniosek nr {id} o urlop, rodzaj urlopu: {type}"))
    return result


def make_pretty_other_application_strings(data: list):
    result = []
    for id, description in data:
        result.append((id, f"Wniosek nr {id}, opis: {description}"))
    return result


def make_pretty_certificates_strings(data: list):
    result = []
    for id, name,description in data:
        result.append((id, f"Certyfikat nr {id} ({name}), opis: {description if description else ''}"))
    return result