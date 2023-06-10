from dataclasses import dataclass


@dataclass
class ContactData:
    id: int
    telephone_number: str
    fax: str
    private_email: str
    employee_id: int