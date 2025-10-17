CREATE DATABASE alx_book_store;
USE alx_book_store;

CREATE TABLE alx_book_store (
	book_id INT PRIMARY KEY,
	title VARCHAR(130),
	FOREIGN KEY (author_id) REFERENCES authors(author_id),
	price DOUBLE,
	publication_date DATE
    );
    