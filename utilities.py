from flask import request
from typing import List


def read_employee_data() -> List[str]:
    name = request.form['name']
    surname = request.form['surname']
    street = request.form['street']
    house_nr = request.form['house_nr']
    flat_nr = request.form['flat_nr']
    PESEL = request.form['phone_nr']
    email = request.form['mail']
    county_id = request.form['county_id']
    town_id = request.form['town_id']
    return [name, surname, street, house_nr, flat_nr, PESEL, email, county_id, town_id]


def make_insert_statement(table_name: str, data: List[str]) -> str:
    query = f"INSERT INTO {table_name} VALUES ("
    for piece in data:
        query += f"{piece}, "
    query += ");"
    return query