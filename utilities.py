from flask import request
from typing import List, Tuple


def read_employee_data() -> List[str]:
    def split_addres_id(address: str) -> Tuple[str, str]:
        address = address[1:-1]
        return address.split(',')
    id = 300
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


def make_insert_statement(table_name: str, data: List[str]) -> str:
    query = f"INSERT INTO {table_name} VALUES ("
    for piece in data:
        query += f"{piece}, "
    query = query[:-2] + ")"
    return query