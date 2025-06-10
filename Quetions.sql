show databases;

create database online_book_store;

use online_book_store;

create table books(
Book_ID	serial primary key,
Title	varchar(50),
Author	varchar(50),
Genre	varchar(50),
Published_Year	int,
Price	numeric (10,2),
Stock int
);

create table customers(
Customer_ID serial primary key,
Name    varchar(50),
Email	varchar(100),
Phone	int,
City	varchar(50),
Country varchar(100)
);


create table orders(
Order_ID	serial primary key,
Customer_ID	int references customers(Customer_ID),
Book_ID	int references books(Book_ID),
Order_Date	date,
Quantity	int,
Total_Amount numeric(10,2)
);


show tables;

-- Import Data into Books Table--

#---For Mysql Workbench---

#---For importing csv data into table first right click on table which you want to import data then right click on
#---table data import vizard and choose location and click next next then finish 

#---For pd Admin----

-- Import Data into Books Table
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'D:\Course Updates\30 Day Series\SQL\CSV\Books.csv' #--path 
CSV HEADER;

-- Import Data into Customers Table
COPY Customers(Customer_ID, Name, Email, Phone, City, Country) 
FROM 'D:\Course Updates\30 Day Series\SQL\CSV\Customers.csv'  #--path
CSV HEADER;

-- Import Data into Orders Table
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'D:\Course Updates\30 Day Series\SQL\CSV\Orders.csv' #--path
CSV HEADER;


select * from books;

select * from customers;

select * from orders;


-- 1) Retrieve all books in the "Fiction" genre:



-- 2) Find books published after the year 1950:


-- 3) List all customers from the Canada:


-- 4) Show orders placed in November 2023:


-- 5) Retrieve the total stock of books available:


-- 6) Find the details of the most expensive book:


-- 7) Show all customers who ordered more than 1 quantity of a book:


-- 8) Retrieve all orders where the total amount exceeds $20:


-- 9) List all genres available in the Books table:


-- 10) Find the book with the lowest stock:


-- 11) Calculate the total revenue generated from all orders:

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:



-- 2) Find the average price of books in the "Fantasy" genre:



-- 3) List customers who have placed at least 2 orders:


-- 4) Find the most frequently ordered book:


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :



-- 6) Retrieve the total quantity of books sold by each author:


-- 7) List the cities where customers who spent over $30 are located:


-- 8) Find the customer who spent the most on orders:


#--9) Calculate the stock remaining after fulfilling all orders: