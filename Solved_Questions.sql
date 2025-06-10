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

#---For inporting csv data into table first yoy right click to table which you want to import data then click on
#---table data import vizard and choose location and click next next then finish 

select * from books;

select * from customers;

select * from orders;


-- 1) Retrieve all books in the "Fiction" genre:

select * from books
where genre="Fiction";

-- 2) Find books published after the year 1950:

select * from books
where published_year >1950;

-- 3) List all customers from the Canada:

select * from customers 
where country="canada";

-- 4) Show orders placed in November 2023:

select * from orders 
where month(order_date)=11; 

-- 5) Retrieve the total stock of books available:

select sum(stock) from books;

-- 6) Find the details of the most expensive book:

select * from books
where price =(select max(price) from books);


-- 7) Show all customers who ordered more than 1 quantity of a book:

select distinct(name) from customers
group by name 
having count(*)>1 ;

-- 8) Retrieve all orders where the total amount exceeds $20:

select * from orders 
where total_amount>20;

-- 9) List all genres available in the Books table:

select distinct(genre) from books; 

-- 10) Find the book with the lowest stock:

select title,stock from books
where stock =(select min(stock) from books);

-- 11) Calculate the total revenue generated from all orders:

select sum(total_amount) as total_revenue from orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

select genre,count(title) as no_of_books from books
group by genre; 

-- 2) Find the average price of books in the "Fantasy" genre:

select avg(price) from books
where genre="Fantasy";

-- 3) List customers who have placed at least 2 orders:

select customers.name,count(orders.customer_id) from orders
join customers  on customers.customer_id=orders.customer_id
group by customers.name
having count(*)>1;

-- 4) Find the most frequently ordered book:

SELECT  books.title, COUNT(orders.book_id) AS ORDER_COUNT
FROM orders 
JOIN books  ON orders.book_id=books.book_id
GROUP BY orders.book_id
ORDER BY ORDER_COUNT DESC LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

select price,title from books
where genre="Fantasy"
order by price desc limit 3;


-- 6) Retrieve the total quantity of books sold by each author:

select sum(orders.quantity),books.author from books
join orders on books.book_id=orders.book_id
group by author ;

-- 7) List the cities where customers who spent over $30 are located:

select distinct(customers.city),orders.total_amount from customers
join orders on orders.customer_id=customers.customer_id
where orders.total_amount>30;

-- 8) Find the customer who spent the most on orders:

select distinct(customers.name),orders.total_amount from customers
join orders on customers.customer_id=orders.customer_id
order by orders.total_amount desc limit 1;


#--9) Calculate the stock remaining after fulfilling all orders:

select sum(orders.quantity)-sum(books.stock) as stick_remaining from orders
join books on books.book_id=orders.book_id;

SELECT books.book_id, books.title, books.stock,
coalesce(sum(orders.quantity),0) as ordered_quentity,books.stock- coalesce(sum(orders.quantity),0) as stock_remaning
FROM books 
left JOIN orders  ON books.book_id=orders.book_id
GROUP BY books.book_id ;
