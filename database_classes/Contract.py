from dataclasses import dataclass


@dataclass
class Contract:
    id: int
    type: str
    date_signed: str
    date_expire: str
    salary: int
    currency: str
    account_number: str
    employee_id: int