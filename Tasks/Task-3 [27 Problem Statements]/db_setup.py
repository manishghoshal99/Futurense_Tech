import mysql.connector
import pandas as pd

config = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'Mei!N3$eQLm@n!$#112#',
    'database': 'healthcare_department' 
}


def upload_csv(file_path, table_name):
    data = pd.read_csv(file_path)
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()

    for i, row in data.iterrows():
        query = f"INSERT INTO {table_name} VALUES ({','.join(['%s'] * len(row))})"
        cursor.execute(query, tuple(row.values))

    cnx.commit()
    cursor.close()
    cnx.close()


import os
for file in os.listdir('/Users/manishghoshal/Downloads/Futurense_Internship-main/Tasks/Task-3 [27 Problem Statements]/Clean Data'):
    if file.endswith('.csv'):
        file_path = os.path.join('Clean Data', file)
        table_name = file.split('.')[0]  # Extract table name from file name
        upload_csv(file_path, table_name)
