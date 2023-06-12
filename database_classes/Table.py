import resources.constants as const
from typing import Dict, List
from dataclasses import dataclass


@dataclass
class Table():
    _name: str
    _columns: List[str]

    def get_name(self):
        return self._name

    def get_columns(self):
        return self._columns
    

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