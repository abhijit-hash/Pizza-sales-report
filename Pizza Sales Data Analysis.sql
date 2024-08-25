--Print Pizza Sales Table
SELECT * FROM pizza_sales

  --KPI"S
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_Order_Value FROM pizza_sales
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order FROM pizza_sales

--Daily trend For Total Orders
  
SELECT DATENAME(DW,order_date) AS Order_Day, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY DATENAME(DW,order_date), DATEPART(WEEKDAY,order_date) ORDER BY DATEPART(WEEKDAY,order_date)

--Monthly trend For Total Orders
SELECT DATENAME(MONTH,order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales GROUP BY DATENAME(MONTH,order_date), DATEPART(MONTH,order_date) ORDER BY DATEPART(MONTH,order_date)

-- % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT FROM pizza_sales GROUP BY pizza_category

-- % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT FROM pizza_sales GROUP BY pizza_size ORDER BY pizza_size

--Total Pizzas Sold by Pizza Category 
SELECT pizza_category, SUM(quantity) AS total_quantity_sold FROM pizza_sales GROUP BY pizza_category ORDER BY total_quantity_sold DESC

--Top 5 Pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue FROM pizza_sales GROUP BY pizza_name ORDER BY total_revenue DESC

--Bottom 5 Pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue FROM pizza_sales GROUP BY pizza_name ORDER BY total_revenue ASC

--. Top 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizza_sold FROM pizza_sales GROUP BY pizza_name ORDER BY total_pizza_sold DESC

--Bottom 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizza_sold FROM pizza_sales GROUP BY pizza_name ORDER BY total_pizza_sold ASC

--Top 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY pizza_name ORDER BY total_orders DESC

--Bottom 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY pizza_name ORDER BY total_orders ASC
