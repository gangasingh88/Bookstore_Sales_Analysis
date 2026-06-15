use bookstore_db;
create table Books (
BOOK_ID SERIAL PRIMARY KEY,
Titile VARCHAR(100),
Author VARCHAR(50),
Genre VARCHAR(50),
Published_Year INT,
Price numeric(10,2),
STOCK INT
);
create table Customers (
Customer_ID SERIAL PRIMARY KEY,
Customer_Name VARCHAR(100),
Email VARCHAR(100),
Phone VARCHAR(15),
City VARCHAR(50),
Country VARCHAR(150)
);
create table Orders (
Order_ID SERIAL PRIMARY KEY,
Customer_ID BIGINT UNSIGNED,
Book_ID BIGINT UNSIGNED,
Order_Date DATE,
Quantity INT,
Total_Amount NUMERIC(10,2)
);
USE bookstore_db;
select * from Books;

-- Basic Queries
--1) Retrieve all books in the "Fiction" genre:

select * from Books where genre="Fiction";

--2)Find books published after the year 1950:

SELECT * FROM Books
WHERE Published_Year>1950;

--3) List all customers from Canada:

select * from Customers
where Country = 'Canada';

--4) show orders placed in November 2023:

select * from Orders
where Order_Date between '2023-11-01' and '2023-11-30';

--5) Retrieve the total stocks of books available:
select SUM(stock) as Total_Stock from Books;

--6) Find the details of the Most expensive books:
select * from Books
order by Price desc
limit 1;

--7) Show all customers who ordered more than one quantity of books:
select * from Orders
where Quantity>1;

--8) Retrieve all the orders where the total amount exceeds $20:
select * from Orders
where Total_Amount>20;

-- 9) List all genre available on the books table:
select distinct(genre) from Books; 

--10) Find the book with the lowest stock:
select * from Books
order by Stock 
limit 1; 

--11) Find the average price of books in the "Fantasy" genre:
select avg(stock) as Average_Price from Books
where Genre='Fantasy'; 
 
--12) calculate total revenue generated from all orders:
select sum(Total_Amount) as Revenue from Orders;

-- Advance Query
--1) Retrieve the total no of books sold for each genre:

 select b.Genre, sum(o.Quantity) 
as Total_Books_Sold
from Orders o 
join Books b 
on o.Book_ID =b.Book_ID 
group by 1; 

--2)list the customers who have paid at least 2 orders:
 
 select customer_id, count(Order_ID) as Order_Count
 from Orders 
 group by Customer_ID 
 having count(Order_ID)>2; 
 
--3)
 select Book_ID, count(Order_ID) as Order_Count
 from Orders 
 group by Book_ID 
 order by Order_Count desc 
 limit 1; 
 
--4) Find the most frequently orders book:

 select o.Book_ID, b.Titile ,count(o.order_id) as Order_Count
from Orders o 
join Books b 
on o.Book_ID =b.Book_ID 
group by o.Book_ID,b.Titile
order by Order_Count desc
limit 1;

--5) show the top 3 most expensive books of 'Fantasy' Genre:

select * from Books
 where Genre= 'Fantasy'
order by Price desc 
 limit 3; 

 --6) Retrieve the total quantity of books sold by each author;

 select b.Author,sum(o.Quantity) as Total_Books_Sold
from Orders o 
join Books b 
on o.Book_ID =b.Book_ID 
group by b.Author;

--7) list the cities where customers who spent over $30 are located:

select distinct c.city, Total_Amount
from Orders o
join Customers c 
on o.Customer_ID=c.Customer_ID
where o.Total_Amount>30; 

--8) Find the customers who spent the most on orders:

select c.Customer_ID, c.Customer_Name, sum(o.total_Amount) as Total_spend
from Orders o
join Customers c 
on o.Customer_ID=c.Customer_ID
group by 1,2
order by Total_spend desc 
limit 1; 







 
 

 
 
 



