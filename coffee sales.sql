Create database coffee_db;

use coffee_db;

Create table coffee_sales (
order_id Int primary key,
order_date DATE,
customer_id varchar(20),
customer_name varchar(50),
city varchar(50),
product varchar(100),
category varchar(50),
quantity INT, 
unit_price DECIMAL (10,2),
Total_sales Decimal(10,2),
payment_mode varchar(50)
);

select count(*) as total_rows
from coffee_sales;

select * from coffee_sales;

select distinct city from coffee_sales;

select  distinct product from coffee_sales;

select *  from coffee_sales;

# where 
# display only customer , product name 
select customer_name, product
from coffee_sales;

# find all order from delhi 
select * 
from coffee_sales
where city='delhi';

# find orders with sales greater than 500
select * 
from coffee_sales
where total_sales>500;

# find orders from upi
select * 
from coffee_sales
where payment_mode = 'credit card';

# count total orders
select count(*) as total_order
from coffee_sales;

# calculate total reveneue
select sum(total_sales) as total_revenue
from coffee_sales;

# find average sales amount
select avg(total_sales) as avg_sales
from coffee_sales;

# find highest sales orders
select max(total_sales) as highest_sales
from coffee_sales;

# find lowest sales orders
select min(total_sales) as lowest_sales
from coffee_sales;

# revenue by city
select city, sum(total_sales) as revenue
from coffee_sales
group by city;

# orders by paymemt mode
select payment_mode, count(*) as total_orders
from coffee_sales
group by payment_mode;

# quantity sold by product 
select product, sum(quantity)as total_quantity
from coffee_sales
group by product;

# revenue by category
select category, sum(total_sales) as revenue
from coffee_sales
group by category;

# top 5 products by revenue
select product, sum(total_sales) as revenue
from coffee_sales
group by product
order by revenue DESC 
limit 5;

# cities with revenue greater than 10000
select city, sum(total_sales) as reveune 
from coffee_sales
group  by city
having sum(total_sales)>10000;

# products sold more than 100 times
select product, sum(quantity) as total_quantity
from coffee_sales
group by product
having sum(quantity)>100;

# categories with more than 50 orders
select category, count(*) as total_orders
from coffee_sales
group by category
having count(*)>50;

# upi revenue by city
select city, sum(total_sales) as revenue
from coffee_sales
where payment_mode='upi'
group by city;

# upi revenue above 5000
select city , sum(total_sales) as revenue
from coffee_sales
where payment_mode='upi'
group by city
having sum(total_sales) >5000;

# show order from a specific city
select * 
from coffee_sales
where city ='mumbai';

# show orders where quantity is greater than 2 
select * 
from coffee_sales
where quantity>2;

# count orders in each city
select city, count(*) as total_orders
from coffee_sales
group by city;

# dense rank products by reveenue
select
 product, 
SUM(Total_sales) AS revenue,
DENSE_RANK() OVER (
ORDER BY sum(Total_sales) DESC
) AS  rnk
from coffee_sales
group by product;

# rank product by revenue
select product, 
sum(Total_sales) as revenue,
RANK() over (
order by sum(Total_sales) DESC
) AS rnk
from coffee_sales
group by product;

# row  number rank products by revenue
select product, 
sum(Total_sales) as revenue,
row_number() over (
order by sum(Total_sales) DESC
) as row_num
from coffee_sales
group by product;

# show all records from coffee sales
select product
from coffee_sales;

select customer_name
from coffee_sales;

# show customer name and city
select customer_name, city
from coffee_sales;

# show first 10 records
select product
from coffee_sales
limit 10;

# count total orders
select 
count(*) as Total_order
from coffee_sales;

select product, 
count(*) as Total_order
from coffee_sales
group by product;

# where 
# show orders from delhi
select * 
from coffee_sales
where city ='delhi'
limit 5;

# show orders where quantity 2
select *
from coffee_sales
where quantity>2;

# show orders where unit price > 200
select * 
from coffee_sales
where unit_price>200;

# show espresso orders
select *
from coffee_sales
where product= 'Espresso';

# show orders from mumbai and quantity > 3 
select * 
from coffee_sales
where city='mumbai'
AND quantity >3;

# order by 
# sort orders by quantity ascending
select product
from coffee_sales
order by product ASC;

# SORT orders by quantity descending
select product
from coffee_sales
order by product DESC;

# sort orders by unit proce desccending
select unit_price
from coffee_sales
order by unit_price DESC;

# sort orders by total_sales descending 
select Total_sales
from coffee_sales
order by Total_sales DESC;

# sort customer name alphabetically
select customer_name
from coffee_sales
order by Customer_name ASC;

# aggregate functions 
# find total quantity sold
select product,
sum(quantity) as Total_quantity
from coffee_sales
group by product;

# find average unit price
select product,
avg(unit_price) as avg_price
from coffee_sales
group by product;

# find highest price 
select product,
max(unit_price) as Highest_price
from coffee_sales
group by product;

# find lowest price
select product,
min(unit_price) as Lowest_price
from coffee_sales
group by product;

# find total sales amount
select product,
sum(Total_sales) as Total_sales
from coffee_sales
group by product;

# group by 
# count orders in each city
select city, 
count(*) as Total_orders
from coffee_sales
group by city;

# total sales by city
select city,
sum(total_sales) as Total_sales
from coffee_sales
group by city;

# total sales by product
select product,
sum(total_sales) as Total_sales
from coffee_sales
group by product;

# avaerage unit price by product
select product,
avg(Unit_price) as Avg_price
from coffee_sales
group by product;

# total quantity sold prodcut
select product,
sum(quantity) as Total_quantity
from coffee_sales
group by product;

# having
# cities with more than 50 orders
select city,
count(*) AS total_orders
from coffee_sales
group by city
having count(*) >50;

# products with total sales greater than 5000
select product,
sum(total_sales)as Total_sales
from coffee_sales
group by product
having sum(Total_sales)>5000;

# cities with total sales grater than 10000
select city,
sum(total_sales) as Total_sales
from coffee_sales
group by city
having sum(Total_sales)>10000;

# product with average price greater than 200
select product,
avg(Unit_price) as Avg_price
from coffee_sales
group by product
having avg(Unit_price)>200;

# cities where total quantity sold is greater than 100
select city, 
sum(quantity) as Total_quantity
from coffee_sales
group by city
having sum(quantity)>100;

# wimdow function 
# assign row number to all orders by total_sales
select product, 
sum(Total_sales) as revenue,
Row_number() over (
order by sum(Total_sales) DESC
) as row_num
from coffee_sales
group by product;

# rank products by total sales using rank()
select product, 
sum(Total_sales) as revenue,
RANK() over (
order by sum(Total_sales) DESC
) as rnk
from coffee_sales
group by product;

# rank products by total sales using dense rank
select product, 
sum(Total_sales) as revenue,
DENSE_RANK() over (
order by sum(Total_sales) DESC 
) as DNSE_RNK
FROM Coffee_sales
group by product;

# show top 5 highest sales orders
select order_id, customer_name, product, total_sales
from coffee_sales
order by Total_sales DESC
limit 5;

# rank customer based on total spending
select customer_name,
sum(total_sales) as spending,
rank() over (
order by sum(total_sales) DESC
) as customer_rnk
from coffee_sales
group by customer_name;

# top 3 customer by spending
select customer_name, sum(Total_sales) as spending
from coffee_sales
group by customer_name
order by spending DESC
limit 3;

# where
# customer name starting with A 
select * 
from coffee_sales
where customer_name like'A%';

# coffee types containing 'latte'
select * 
from coffee_sales
where product Like 'latte%';

# not queries
# orders not paid by cash
select * 
from coffee_sales
where payment_mode <> 'cash';

# orders not from delhi
select *
from coffee_sales
where city <> 'delhi';

# orders with quantity>2 and price >300
select * 
from coffee_sales
where quantity > 2
AND unit_price >300;

# cte 
# find all orders where total sale amount is greater than 500
with sales_cte as (
select * ,
quantity* unit_price as Total_sale
from coffee_sales
)
select *
from sales_cte
where Total_sale>500;

# calculate total sales amount for each customer
with customer_sales AS (
select customer_name,
sum(quantity*unit_price) as Total_spending
from coffee_sales
group by customer_name
)
select*
from customer_sales;

# find custoemrs whose total spending is greater than 1000
with customer_sales AS (
select customer_name, 
sum(quantity*unit_price) as Total_spending
from coffee_sales
group by customer_name
)
select *
from customer_sales
where Total_spending>1000;

# display top 5 customers based on total spending 
with customer_sales AS (
select customer_name,
sum(quantity*unit_price) as Total_spending
from coffee_sales
group by customer_name
)
select *
from customer_sales
order by Total_spending DESC 
limit 5;

# calcualte total sales each coffee product
with product_sales AS (
select product, 
sum(quantity*unit_price) as Total_sales
from coffee_sales
group by product
)
select *
from product_sales;

