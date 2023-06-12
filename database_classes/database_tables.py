from Table import Table
import resources.constants as const


table_benefit = Table(
    const.TABLE_NAME_OTHER_BENEFIT,
    [
        "id_benefitu",
        "nazwa",
        "data_przyznania",
        "data_odebrania"
    ]
)