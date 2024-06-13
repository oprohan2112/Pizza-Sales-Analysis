
--    -----------------       MySQL Project - Pizza-Sales-Analysis    -----------------------

CREATE SCHEMA Pizza_sales ;
USE Pizza_sales ;

-- Import Data And Read Data -- 
SELECT * FROM pizza_sales.pizza_sales ;
           -- OR -- 
SELECT * FROM pizza_sales ;


-- 1) Total Revenue :
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;


-- 2) Average Order Value :
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales ;


-- 3) Total Pizzas Sold :
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales ;

-- 4) Total Orders :
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;
 
 
-- 5) Average Pizzas Per Order :
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;
 
 
-- 6) % of Sales by Pizza Category :
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category ;


-- 7) % of Sales by Pizza Size :
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size ;


-- 8) Total Pizzas Sold by Pizza Category ;
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC ;


-- 9) Top 5 Pizzas by Revenue : 
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5 ;
 
 
-- 10) Bottom 5 Pizzas by Revenue :
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5 ;
 
 
-- 11) Top 5 Pizzas by Quantity :
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5 ;
 
 
-- 12) Bottom 5 Pizzas by Quantity :
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5 ;

-- 13) Top 5 Pizzas by Total Orders :
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5 ;
 
 
-- 14) Borrom 5 Pizzas by Total Orders :
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5; 

 