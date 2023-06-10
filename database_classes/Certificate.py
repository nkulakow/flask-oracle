from dataclasses import dataclass


@dataclass
class Certificte:
    id: int
    name: str
    hounrs_number: int
    desription: str
    issued_by: str