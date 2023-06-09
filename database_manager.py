import cx_Oracle


class DatabaseManager:

    def __init__(self, username, password, service_name):
        self.username = username
        self.password = password
        self.service_name = service_name

    def connect_to_db(self):
        host = '172.17.0.1'
        port = '1521'
        dsn = cx_Oracle.makedsn(host, port, service_name=self.service_name)
        connection = cx_Oracle.connect(self.username, self.password, dsn)
        return connection

    def get_all_pracownicy(self):
        connection = self.connect_to_db()
        cursor = connection.cursor()
        try:
            cursor.execute("SELECT * FROM pracownik")
            rows = cursor.fetchall()

            cursor.close()
        except cx_Oracle.Error:
            return f"Error"
        finally:
            connection.close()
            return rows
