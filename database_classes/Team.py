from dataclasses import dataclass


@dataclass
class Team:
    id: int
    project_name: str
    date_established: str
    date_dissolved: str
    date_realization: str
    leader_id: int