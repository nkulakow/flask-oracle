from dataclasses import dataclass


@dataclass
class Province:
    id: int
    name: str


@dataclass
class County:
    id: int
    name: str
    province_id: int


@dataclass
class Town:
    county_id: int
    town_id: int
    name: str
    post_code: str