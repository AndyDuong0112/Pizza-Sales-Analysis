/* Create database Pizza_Sale_Data
and Import Data to SQL Server
How to Import: Click Task => Import Flat File => Choose Data
Note: Data was cleaned so we will skip Cleaning Data Step
*/
CREATE DATABASE Pizza_Sale_Data;

-- Overview Data 
SELECT * 
FROM [dbo].[order_details];

SELECT * 
FROM [dbo].[orders];

SELECT * 
FROM [dbo].[pizza_types];

SELECT * 
FROM [dbo].[pizzas]

-- KPI's Requirements
-- 1 . Total Revenue
SELECT SUM(od.quantity * p.price) AS [total_revenue]
FROM [dbo].[order_details] AS od
INNER JOIN [dbo].[pizzas] AS p
ON od.pizza_id = p.pizza_id;

-- 2. Average Order Value
WITH CTE_table
AS (
SELECT od.order_id
, SUM(p.price * od.quantity) AS [total_price]
FROM [dbo].[order_details] AS od
INNER JOIN [dbo].[pizzas] AS p
ON od.pizza_id = p.pizza_id
GROUP BY od.order_id)

SELECT SUM(total_price) / COUNT(order_id) AS [avg_order_value]
FROM CTE_table;

-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS [total_pizzas_sold]
FROM [dbo].[order_details];

-- 4. Total Orders 
SELECT COUNT(DISTINCT order_id) AS [total_orders]
FROM [dbo].[order_details];

-- 5. Average Pizzas Per Order
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id),2) AS [avg_pizzas_per_order]
FROM [dbo].[order_details];

--------------------------------------------------------------------------------------------------
-- CHART's Requirements
-- 1. Daily Trend for Total Orders
SELECT DATENAME(WEEKDAY,date) AS [order_day]
, COUNT(order_id) AS [total_orders]
FROM [dbo].[orders]
GROUP BY DATENAME(WEEKDAY,date);

-- 2. Monthly Trend for Orders
SELECT DATENAME(MONTH,date) AS [order_month]
, COUNT(order_id) AS [total_orders]
FROM [dbo].[orders]
GROUP BY DATENAME(MONTH,date);

-- 3. Percentage of Sales by Pizza Category
WITH CTE_table
AS (
SELECT pt.category
, SUM(od.quantity * p.price) AS [total_price]
FROM [dbo].[pizza_types] AS pt
INNER JOIN [dbo].[pizzas] AS p
ON pt.pizza_type_id = p.pizza_type_id
INNER JOIN [dbo].[order_details] AS od
ON p.pizza_id = od.pizza_id
GROUP BY pt.category)

SELECT category
, total_price
, ROUND(total_price / (SELECT SUM(total_price) FROM CTE_table) * 100, 2) AS [percentage_of_sales_by_category]
FROM CTE_table
GROUP BY category, total_price
ORDER BY total_price DESC;

-- 4. Percentage of Sales by Pizza Size
WITH CTE_table
AS (
SELECT p.size
, SUM(od.quantity * p.price) AS [total_price]
FROM [dbo].[pizzas] AS p
INNER JOIN [dbo].[order_details] AS od
ON p.pizza_id = od.pizza_id
GROUP BY p.size)

SELECT size
, total_price
, ROUND(total_price / (SELECT SUM(total_price) FROM CTE_table) * 100, 2) AS [percentage_of_sales_by_size]
FROM CTE_table
GROUP BY size, total_price
ORDER BY total_price DESC;

-- 5. Total Pizzas Sold by Pizza Category
SELECT pt.category
, SUM(od.quantity) AS [total_pizzas]
FROM [dbo].[pizza_types] AS pt
INNER JOIN [dbo].[pizzas] AS p
ON pt.pizza_type_id = p.pizza_type_id
INNER JOIN [dbo].[order_details] AS od
ON p.pizza_id = od.pizza_id
GROUP BY pt.category
ORDER BY SUM(od.quantity) DESC;

-- 6. Top 5 Pizzas by Revenue
SELECT TOP 5 pt.name
, SUM(p.price * od.quantity) AS [top_revenue]
FROM [dbo].[pizza_types] AS pt
INNER JOIN [dbo].[pizzas] AS p
ON pt.pizza_type_id = p.pizza_type_id
INNER JOIN [dbo].[order_details] AS od
ON p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY SUM(p.price * od.quantity) DESC;

-- 7. Bottom 5 Pizzas by Revenue
SELECT TOP 5 pt.name
, SUM(p.price * od.quantity) AS [bottom_revenue]
FROM [dbo].[pizza_types] AS pt
INNER JOIN [dbo].[pizzas] AS p
ON pt.pizza_type_id = p.pizza_type_id
INNER JOIN [dbo].[order_details] AS od
ON p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY SUM(p.price * od.quantity) ASC;

-- 8. Top 5 Pizzas by Quantity
SELECT TOP 5 pt.name
, SUM(od.quantity) AS [quantity]
FROM [dbo].[pizza_types] AS pt
INNER JOIN [dbo].[pizzas] AS p
ON pt.pizza_type_id = p.pizza_type_id
INNER JOIN [dbo].[order_details] AS od
ON p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY SUM(od.quantity) DESC;

-- 9.Bottom 5 Pizzas by Quantity
SELECT TOP 5 pt.name
, SUM(od.quantity) AS [quantity]
FROM [dbo].[pizza_types] AS pt
INNER JOIN [dbo].[pizzas] AS p
ON pt.pizza_type_id = p.pizza_type_id
INNER JOIN [dbo].[order_details] AS od
ON p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY SUM(od.quantity) ASC;

-- 10. Top 5 Pizzas by Total Order
SELECT TOP 5 pt.name
, COUNT( DISTINCT od.order_id) AS [total_order]
FROM [dbo].[order_details] AS od
INNER JOIN [dbo].[pizzas] AS p
ON od.pizza_id = p.pizza_id
INNER JOIN [dbo].pizza_types AS pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY COUNT( DISTINCT od.order_id) DESC;

-- 11. Bottom 5 Pizzas by Total Order
SELECT TOP 5 pt.name
, COUNT( DISTINCT od.order_id) AS [total_order]
FROM [dbo].[order_details] AS od
INNER JOIN [dbo].[pizzas] AS p
ON od.pizza_id = p.pizza_id
INNER JOIN [dbo].pizza_types AS pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY COUNT( DISTINCT od.order_id);
