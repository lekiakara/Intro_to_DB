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
    print("Except mysql.connector.Error":", e)

finally:
    # Close connection
    if 'mydb' in locals() and mydb.is_connected():
        cursor.close()
        mydb.close()
        print("MySQL connection closed.")