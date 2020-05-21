import cx_Oracle
import csv

username = "Xenu"
password = "pass"
database = "localhost"
connection = cx_Oracle.connect(username, password, database, encoding='UTF-8') #ãããããããããããã
cursor = connection.cursor()

table_list = ['Pricing', 'Type', 'App', 'Category', 'Genre']

try:
    for table in table_list:
        with open(table + '.csv', 'w', newline='', encoding='UTF-8') as file:
            query = "SELECT * FROM " + table
            cursor.execute(query)
            row = cursor.fetchone()

            cols = []
            for k in cursor.description:
                cols.append(k[0])
            csv_writer = csv.writer(file, delimiter=',')
            csv_writer.writerow(cols)

            while row:
                csv_writer.writerow(row)
                row = cursor.fetchone()
finally:
    cursor.close()
    connection.close()
