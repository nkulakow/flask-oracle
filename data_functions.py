def filter_table_by_phrase(table, phrase):
    filtered_rows = []
    for row in table:
        if any(phrase.lower() in str(cell).lower() for cell in row):
            filtered_rows.append(row)
    return filtered_rows
