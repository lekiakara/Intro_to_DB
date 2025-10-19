import mysql.connector
from mysql.connector import Error

try:
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",          
        password="root"  
    )

    if mydb.is_connected():
        print("Connected to MySQL Server")

        cursor = mydb.cursor()

        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

        print("Database 'alx_book_store' created successfully (or already exists).")

except Error as e:
    print("Error while connecting to MySQL:", e)

finally:
    # Close connection
    if 'mydb' in locals() and mydb.is_connected():
        cursor.close()
        mydb.close()
        print("MySQL connection closed.")

cursor = mydb.cursor()
cursor = cursor.execute("""
                        CREATE TABLE book (
	                    book_id INT PRIMARY KEY,
                        title VARCHAR(130),
                        author_id INT,
                        price DOUBLE,
                        publication_date date,
                        foreign key (author_id) references authors(author_id)
                        )
                    """)



cursor = mydb.cursor()
cursor = cursor.execute("""
                        CREATE TABLE authors (
	                    author_id INT PRIMARY KEY,
                        author_name VARCHAR(215)
                        )
                        """);