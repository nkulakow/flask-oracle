from typing import List
from dataclasses import dataclass


@dataclass
class Employee:
    id: int
    name: str
    surname: str
    street: str
    home_number: int
    PESEL: str
    email: str
    position_id: int
    county_id: int
    town_id: int
    flat_number: int = None
    is_blocked: bool = False

    def get_database_fields(self) -> List[str]:
        return [
            str(self.id),
            self.name,
            self.surname,
            self.street,
            str(self.home_number),
            str(self.flat_number) if self.flat_number else "NULL",
            self.PESEL,
            str(self.is_blocked),
            str(self.position_id),
            str(self.county_id),
            str(self.town_id)
        ]