SELECT * FROM pizza_sales

--- Total Revenue
select sum(total_price) as total_revenue 
from pizza_sales

--- Average Order Value
select sum(total_price) / count(distinct order_id) as Avg_order_value
from pizza_sales

--- Total Pizzas Sold
select sum(quantity) as total_pizzas_sold
from pizza_sales

--- Total Orders
select count (distinct order_id) as total_orders
from pizza_sales


--- Average Pizzas Per Order
select cast(cast(sum(quantity) as decimal(10,2))
       / cast(count (distinct order_id) as decimal(10,2)) as decimal (10,2)) as avg_pizza_per_order
from pizza_sales


---- Daily trends for total Orders
select datename(DW, Order_date) as order_day, count (distinct order_id) as total_orders
from pizza_sales
group by datename(DW, Order_date)

---- Monthly trends for total Orders

select Datepart(Month, Order_date) as Order_month, count (distinct order_id) as total_orders
from pizza_sales
group by datepart(Month, Order_date)
order by Order_month


---- Hourly trends for total Orders

select datepart(Hour, order_time) as time_in_hrs, count (distinct order_id) as total_orders
from pizza_sales
group by datepart(Hour, order_time)


---- Percentage of Sales by Pizzas Category
select pizza_category as category, sum(total_price)*100/ 
		(select sum (total_price) from pizza_sales) as percentage_sales
from pizza_sales
group by pizza_category

---- top 5 pizzas sold by total amount
select top 5 pizza_name, sum(total_Price) as sale_amount
from pizza_sales
group by pizza_name
order by sale_amount desc

---- Bottom 5 pizzas sold by total amount
select top 5 pizza_name, sum(total_Price) as sale_amount
from pizza_sales
group by pizza_name
order by sale_amount asc


---- top 5 pizzas sold by quantity
select top 5 pizza_name, sum(quantity) as quantity_ordered
from pizza_sales
group by pizza_name
order by quantity_ordered desc

---- bottom 5 pizzas sold by quantity
select top 5 pizza_name, sum(quantity) as quantity_ordered
from pizza_sales
group by pizza_name
order by quantity_ordered asc

---- top 5 pizzas sold by total_orders
select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc


---- bottom 5 pizzas sold by total_orders
select top 5 pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders asc


---- percetage of sales by sizes
select pizza_size , sum(total_price)*100/ 
		(select sum (total_price) from pizza_sales) as percentage_sales
from pizza_sales
group by pizza_size
order by percentage_sales desc

---- Total Pizza's sold by category
select pizza_category , sum(quantity) as qty_sold
from pizza_sales
group by pizza_category
order by qty_sold

---- 