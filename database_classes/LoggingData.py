from dataclasses import dataclass


@dataclass
class ContactData:
    login_id: int
    login: str
    shortcut: str
    date_previous_log: str = None