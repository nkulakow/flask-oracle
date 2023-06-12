from typing import Dict, List
from dataclasses import dataclass, field


@dataclass
class Table():
    _name: str
    _columns: List[str]
    data: List[List[str]] = field(default_factory = List[List[str]])

    def get_name(self):
        return self._name

    def gen_columns(self):
        return self._columns