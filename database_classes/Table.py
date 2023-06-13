import resources.constants as const
from typing import Dict, List
from dataclasses import dataclass


@dataclass
class Table():
    _name: str
    _columns: List[str]
    _id_position: int = 0

    def get_name(self):
        return self._name

    def get_columns(self):
        return self._columns
    
    def get_id_position(self) -> int:
        return self._id_position
    

TABLE_EMPLOYEE = Table(
    const.TABLE_NAME_EMPLOYEE,
    [
        "id_pracownika",
        "imie",
        "nazwisko",
        "ulica",
        "nr_domu",
        "nr_mieszkania",
        "pesel",
        "email",
        "zablokowany",
        "id_stanowiska",
        "id_powiatu",
        "id_miejscowosci",
    ]
)

TABLE_CERTIFICATE = Table(
    const.TABLE_NAME_CERTIFICATE,
    [
        "id_certyfikatu",
        "nazwa",
        "liczba_godzin",
        "krotki_opis",
        "wystawiony_przez"
    ]
)

TABLE_CERTIFICATE_EMPLOYEE = Table(
    const.TABLE_NAME_CERTIFICATE_EMPLOYEE,
    [
        "id_certyfikatu",
        "id",
        "data_otrzymania",
        "id_pracownika"
    ],
    1
)

TABLE_APPLICATION = Table(
    const.TABLE_NAME_APPLICATION,
    [
        "id_wniosku",
        "data_zlozenia",
        "nazwa_zalacznika",
        "status",
        "id_pracownika"
    ]
)

TABLE_APPLICATION_HOLIDAY = Table(
    const.TABLE_NAME_APPLICATION_HOLIDAY,
    [
        "id_wniosku",
        "data_rozpoczecia",
        "data_zakonczenia",
        "rodzaj"
    ]
)

TABLE_APPLICATION_BONUS = Table(
    const.TABLE_NAME_APPLICATION_BONUS,
    [
        "id_wniosku",
        "stawka",
        "czy_jednorazowy",
    ]
)

TABLE_APPLICATION_OTHER = Table(
    const.TABLE_NAME_APPLICATION_OTHER,
    [
        "id_wniosku",
        "krotki_opis"
    ]
)

TABLE_EMPLOYEE_LOGIN = Table(
    const.TABLE_NAME_EMPLOYEE_LOGIN,
    [
        "id_pracownika",
        "id_loginu"
    ]
)

TABLE_LOGIN_DATA = Table(
    const.TABLE_NAME_LOGIN_DATA,
    [
        "id_loginu",
        "login",
        "skrot",
        "ostatnio_zalogowany"
    ]
)

TABLE_CONTACT_DATA = Table(
    const.TABLE_NAME_CONTACT_DATA,
    [
        "id_danych",
        "nr_telefonu",
        "fax",
        "email_prywatny",
        "id_pracownika"
    ]
)