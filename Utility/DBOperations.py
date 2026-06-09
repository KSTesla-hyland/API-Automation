import pyodbc
import sys
import os
from Configuration.ADMIN.config import ConfigData
sys.path.append(os.getcwd())

class DbOperations:

    def __init__(self):
        print("DBOperations initialized")

    @staticmethod
    def connectToDB():
        try:
            connection_string = (
                f"Driver={{SQL Server}};"
                f"Server={ConfigData.DB_SERVER_NAME};"
                f"Database={ConfigData.DB_NAME};"
                f"Uid={ConfigData.DB_USERID};"
                f"Pwd={ConfigData.DB_PASSWORD};"
                f"Trusted_Connection=no;"
            )
            obj_connection = pyodbc.connect(connection_string)
            return obj_connection
        except Exception as e:
            print("Unable to connect to Database. Error:", e)
            return None

    @staticmethod
    def executeNonSelectQuery(querystring):
        connection = DbOperations.connectToDB()
        cursor = connection.cursor()
        cursor.execute(querystring)
        connection.commit()
        connection.close()
        # print("Closed database connection successfully!!!!!")

    @staticmethod
    def executeSelectQuery(querystring):
        try:
            connection = DbOperations.connectToDB()
            cursor = connection.cursor()
            cursor.execute(querystring)
            result_row = cursor.fetchone()
            cursor.close()
            connection.close()
            if result_row is not None:
                return result_row[0]
            else:
                return None
        except pyodbc.Error as e:
            return None
