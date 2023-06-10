from dataclasses import dataclass


@dataclass
class Benefit:
    id: int
    name: str
    date_obtained: str
    date_taken: str
    employee_id: int


@dataclass
class Bonus(Benefit):
    sum: int


@dataclass
class Car(Benefit):
    id: int
    licence_number: str
    brand: str
    model: str
    last_review: str
    next_review: str


@dataclass
class ElectrionicalDevice(Benefit):
    type: str
    brand: str
    model: str
    serial_number: int


@dataclass
class OtherBenefit(Benefit):
    description: str