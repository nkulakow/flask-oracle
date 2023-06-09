def read_bd_info_from_file(file_name: str = "resources/dane_bazy.txt") -> [str]:
    with open(file_name, 'r') as file:
        values = []
        for i, line in enumerate(file):
            if i < 3:
                value = line.strip()  # Remove leading/trailing whitespace
                values.append(value)

    return values
