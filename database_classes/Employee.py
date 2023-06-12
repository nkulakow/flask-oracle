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
            f"{self.id}",
            f"'{self.name}'",
            f"'{self.surname}'",
            f"'{self.street}'",
            f"{self.home_number}",
            f"{self.flat_number}" if self.flat_number else "NULL",
            f"'{self.PESEL}'",
            f"'{self.email}'",
            f"{int(self.is_blocked)}",
            f"{self.position_id}",
            f"{self.county_id}",
            f"{self.town_id}"
        ]