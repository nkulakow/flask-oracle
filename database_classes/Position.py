from dataclasses import dataclass


@dataclass
class Position:
    id: int
    name: str
    is_staff: bool