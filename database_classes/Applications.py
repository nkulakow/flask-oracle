from dataclasses import dataclass


@dataclass
class Application:
    id: int
    date_applied: str
    attachment_name: str
    status: str
    employee_id: int


@dataclass
class HolidayApplication:
    date_begin: str
    date_end: str
    type: str


@dataclass
class BonusApplication:
    sum: int
    one_time: bool


@dataclass
class OtherApplication:
    description: str