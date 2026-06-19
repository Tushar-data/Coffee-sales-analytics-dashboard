Create Database Coffee_db;
use coffee_db;

Create Table customers (
Customer_Id INT Primary KEY,
Customer_name Varchar(50),
city varchar(50),
signup_date DATE
);

Insert into  customers Values 
(1, 'Rahul sharma', 'Delhi', '2024-01-15'),
(2, 'Priya verma', 'mumbai', '2024-02-10'),
(3, 'amit kumar', 'pune', '2024-05-09'),
(4, 'neha jain', 'banglore', '2024-06-20'),
(5, 'ujjwal chauhan', 'gurugram', '2024-05-25');

select * from customers;

Create table products (
product_id Int primary key,
product_name varchar(40),
category varchar (50),
price decimal (10,2)
);

Insert into products values
(101, 'cappucciono', 'coffee', 180),
(102, 'latte', 'coffee', 249),
(103, 'espresso', 'coffee', 150),
(104, 'mocha', 'coffee', 220),
(105, 'cold coffee', 'coffee', 349);

select * from products;

create table orders (
order_id INT primary key,
customer_id INT, 
order_date DATE, 
total_amount Decimal(10,2),
foreign key (customer_id) references customers(customer_ID)
);

Insert into orders values
(1001, 1, '2025-01-05', 280),
(1002, 2, '2025-05-25', 350),
(1003, 3, '2025-08-19', 400),
(1004, 4, '2025-01-12', 450),
(1005, 5, '2025-09-11', 370);
 
select * from orders;
 
 Create table order_items (
 order_item_id INT primary key, 
 order_id INT,
 product_id INT, 
 quantity INT,
 foreign key(order_id)references orders(order_id),
 foreign key(product_id) references products(product_id)
 );
 
 Insert into order_items values
 (1, 1001, 101, 2),
 (2, 1002, 102, 4),
 (3, 1003, 103, 5),
 (4, 1004, 104, 2),
 (5, 1005, 105, 3);
 
 select * from order_items;
 
 
 # inner  join query 
 select c.customer_name, o.order_id, o.total_amount
 from customers c
 join orders o
 on c.customer_Id = o.customer_id;

# table  join 





