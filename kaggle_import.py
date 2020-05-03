import cx_Oracle
import csv

username = "Xenu"
password = "pass"
database = "localhost"
connection = cx_Oracle.connect(username, password, database, encoding='UTF-8') #ãããããããããããã
cursor = connection.cursor()

filename = "googleplaystore.csv"

file = open(filename, newline='', encoding='utf-8')
reader = csv.DictReader(file)

# Захист від повторного заповнення, надоїло вручну бахати
table_list = ['Pricing', 'Type_', 'App_', 'Category', 'Genre']
for i in table_list:
    cursor.execute("delete from", i)

# Костиль для додаткових таблиць, з кількістю елементів в рази меншою за кількість строк в .csv
types = []
categories = []
genres = []

# Захист від зломаних колонок
trash_col = False

try:
    for row in reader:
        # Дякую Боже, що датасет (майже)без помилок
        app_name = row['App']
        app_category = row['Category']
        app_genre = row['Genres']
        razmer = row['Size']
        last_updated = row['Last Updated']
        current_ver = row['Current Ver']
        pricing_type = row['Type']
        price = row['Price']

        # Захист від зломаних колонок
        attr_list = [app_name, app_category, app_genre, razmer, last_updated, current_ver, pricing_type, price]
        
        for attr in attr_list:
            if attr == '':
                print(row)
                trash_col = True
                continue
        if trash_col:
            trash_col = False
            continue
        
        # Костиль для додаткових таблиць, з кількістю елементів в рази меншою за кількість строк в .csv
        if pricing_type not in types:
            types.append(pricing_type)
            query = """INSERT INTO Type_(pricing_type) VALUES (:pricing_type)"""
            cursor.execute(query, pricing_type = pricing_type)
        if app_category not in categories:
            categories.append(app_category)
            query = """INSERT INTO Category(app_category) VALUES (:app_category)"""
            cursor.execute(query, app_category = app_category)
        if app_genre not in genres:
            genres.append(app_genre)
            query = """INSERT INTO Genre(app_genre) VALUES (:app_genre)"""
            cursor.execute(query, app_genre = app_genre)

        # Дякую Боже, що датасет (майже)без помилок
        query = """INSERT INTO App_(app_name, app_category, app_genre, size_, last_updated, current_ver) VALUES (:app_name, :app_category, :app_genre, :size_, :last_updated, :current_ver)"""
        cursor.execute(query, app_name = app_name, app_category = app_category, app_genre = app_genre, size_ = razmer, last_updated = last_updated, current_ver = current_ver)
        query = """INSERT INTO Pricing(app_name, pricing_type, price) VALUES (:app_name, :pricing_type, :price)"""
        cursor.execute(query, app_name = app_name, pricing_type = pricing_type, price = price)
except:
    # На фікс
    print(row)
    raise
finally:
    connection.commit()
    cursor.close()
    connection.close()
