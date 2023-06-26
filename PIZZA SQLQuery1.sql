select *
from pizza_sales


---Total Revenue, that is the sum of all pizza orders

select SUM(total_price) AS Total_Revenue
from pizza_sales



---Average Order value, that is the average amount spent per order.

select SUM(total_price)/ COUNT(DISTINCT order_id) AS Avg_order_value
from pizza_sales


---Total Quanity of Pizzas sold, that is sum of all the pizzas sold. 

select SUM(quantity) AS Total_pizzas_sold
from pizza_sales


---Total Orders Placed, That is the total orders placed.

select COUNT(DISTINCT order_id) AS Total_orders
from pizza_sales


---Average pizzas per order.

select SUM(quantity)/ COUNT(DISTINCT order_id) AS Avg_pizzas_per_order
from pizza_sales


---Daily Trend for total orders.

select DATENAME(DW,order_date) AS order_day, COUNT(DISTINCT order_id) total_orders
from pizza_sales
GROUP BY  DATENAME(DW,order_date)


---Hourly Trend

select DATEPART(HOUR,order_time) AS order_hour, COUNT(DISTINCT order_id) total_orders
from pizza_sales
GROUP BY  DATEPART(HOUR,order_time)
ORDER BY  DATEPART(HOUR,order_time)


---Percentage by Pizza Category

select pizza_category, SUM(total_price) * 100/(select SUM(total_price) from pizza_sales)AS Percentage_of_sales
from pizza_sales
GROUP BY  pizza_category


---Percentage by pizza size.

select pizza_size, SUM(total_price) * 100/(select SUM(total_price) from pizza_sales)AS Percentage_of_sales
from pizza_sales
GROUP BY  pizza_size
ORDER BY  Percentage_of_sales DESC

---total pizzas sold by category.

select pizza_category, SUM(quantity) AS total_pizza_sold
from pizza_sales
GROUP BY  pizza_category

---Top 5 best sellers by total pizzas sold.

select TOP 5 pizza_name, SUM(quantity) AS total_pizza_sold
from pizza_sales
GROUP BY  pizza_name
ORDER BY   total_pizza_sold DESC


---Top 5 bottom sellers by total pizzas sold.

select  TOP 5 pizza_name, SUM(quantity) AS total_pizza_sold
from pizza_sales
GROUP BY  pizza_name
ORDER BY   total_pizza_sold ASC