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
                        CREATE TABLE Books(
	                    book_id INT PRIMARY KEY,
                        title VARCHAR(130),
                        author_id INT,
                        price DOUBLE,
                        publication_date date,
                        foreign key (author_id) references authors(author_id)
                        )
                        """);

cursor = mydb.cursor()
cursor = cursor.execute("""
                        CREATE TABLE Authors (
	                    author_id INT PRIMARY KEY,
                        author_name VARCHAR(215)
                        )
                        """);


cursor = mydb.cursor()
cursor = cursor.execute("""  
                        CREATE TABLE Customers(
		                customer_id INT PRIMARY KEY,
                        customer_name VARCHAR(215),
                        email VARCHAR(215),
                        address TEXT
                        )
                        """);

cursor = mydb.cursor()
cursor = cursor.execute("""
                        CREATE TABLE Orders(
	                    order_id INT PRIMARY KEY,
                        customer_id INT,
                        order_date DATE,
                        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
                        )
                        """);

cursor = mydb.cursor()
cursor = cursor.execute("""
                    CREATE TABLE Order_Details(
	                orderdetail_id INT PRIMARY KEY,
                    quantity DOUBLE,
                    order_id INT,
                    book_id INT,
                    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
                    FOREIGN KEY (book_id) REFERENCES books(book_id)
                    )
                    """);
    
    
    
