create table pizza_sales (
 pizza_id	int,
	order_id	int,
	pizza_name_id	text,
	quantity int,
	order_date	date,
	order_time	time,
	unit_price	float,
	total_price	float,
	pizza_size	text,
	pizza_category	text,
	pizza_ingredients text,	
	pizza_name text);
	
SET datestyle = dmy;
copy pizza_sales from 'C:\Program Files\PostgreSQL\16\data\Pizza Sales\pizza_sales.csv' delimiter ',' csv header;

select * from pizza_sales

select sum(total_price) as total_revenue from pizza_sales

select * from pizza_sales

select sum(total_price) / count(distinct order_id) as average_order_value from pizza_sales

select sum(quantity) as total_pizzas_sold from pizza_sales

select count(distinct order_id) as total_orders_placed from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id) as decimal (10,2)) as decimal (10,2)) as average_pizzas_per_order from pizza_sales

SELECT to_char(order_date, 'Day') as order_day, 
count(distinct order_id) as total_order
from pizza_sales as daily_trend
group by order_day 

SELECT to_char(order_date, 'Month') as order_month, 
count(distinct order_id) as total_order
from pizza_sales as monthly_trend
group by order_month 
order by total_order desc

select pizza_category, cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal (10,2)) as total_sales_by_category
from pizza_sales
group by pizza_category

select pizza_size, cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal (10,2)) as total_sales_by_category
from pizza_sales
group by pizza_size

select pizza_category, sum(quantity)
from pizza_sales
group by pizza_category

select pizza_name, sum(quantity) as total_quantity, count(distinct order_id) as total_orders, cast(sum(total_price) as decimal (10,2)) as revenue
from pizza_sales
group by pizza_name
order by revenue desc
limit 5

select pizza_name, sum(quantity) as total_quantity, count(distinct order_id) as total_orders, cast(sum(total_price) as decimal (10,2)) as revenue
from pizza_sales
group by pizza_name
order by total_quantity desc
limit 5

select pizza_name, sum(quantity) as total_quantity, count(distinct order_id) as total_orders, cast(sum(total_price) as decimal (10,2)) as revenue
from pizza_sales
group by pizza_name
order by total_orders desc
limit 5

select pizza_name, sum(quantity) as total_quantity, count(distinct order_id) as total_orders, cast(sum(total_price) as decimal (10,2)) as revenue
from pizza_sales
group by pizza_name
order by revenue 
limit 5

select pizza_name, sum(quantity) as total_quantity, count(distinct order_id) as total_orders, cast(sum(total_price) as decimal (10,2)) as revenue
from pizza_sales
group by pizza_name
order by total_quantity 
limit 5

select pizza_name, sum(quantity) as total_quantity, count(distinct order_id) as total_orders, cast(sum(total_price) as decimal (10,2)) as revenue
from pizza_sales
group by pizza_name
order by total_orders 
limit 5