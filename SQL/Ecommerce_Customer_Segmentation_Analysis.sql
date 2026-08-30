CREATE DATABASE IF NOT EXISTS ecommerce_project;
USE ecommerce_project;

CREATE TABLE ecommerce_sales (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Category VARCHAR(100),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID DECIMAL(10,1),
    Country VARCHAR(100),
    Revenue DECIMAL(12,2),
    IsCancelled BOOLEAN
);
SELECT COUNT(*) AS total_rows
FROM ecommerce_sales;

TRUNCATE TABLE ecommerce_sales;

SHOW VARIABLES LIKE 'local_infile';
USE ecommerce_project;

#added new column
ALTER TABLE ecommerce_sales
ADD COLUMN YearMonth VARCHAR(10);

USE ecommerce_project;

LOAD DATA LOCAL INFILE 'C:/Users/HP/Desktop/Ecommerce_Customer_Segmentation_Analysis/Data/ecommerce_sales_cleaned.csv'
INTO TABLE ecommerce_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    InvoiceNo,
    StockCode,
    Description,
    Category,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,
    Revenue,
    IsCancelled,
    YearMonth
);
#KPIs
SELECT
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    COUNT(DISTINCT CustomerID) AS Total_Customers,
    SUM(Quantity) AS Total_Quantity_Sold,
    ROUND(SUM(Revenue) / COUNT(DISTINCT InvoiceNo),2) AS Average_Order_Value
FROM ecommerce_sales;

#Monthly Revenue
SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS YearMonth,
    ROUND(SUM(Revenue), 2) AS Revenue
FROM ecommerce_sales
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
ORDER BY YearMonth;

#Top 10 revenue products
SELECT
Description AS Product,
ROUND(SUM(Revenue), 2) AS Revenue
FROM ecommerce_sales
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;

#Country wise revenue
SELECT
Country,
ROUND(SUM(Revenue), 2) AS Revenue,
COUNT(DISTINCT CustomerID) AS Customers
FROM ecommerce_sales
GROUP BY Country
ORDER BY Revenue DESC;

# Top 10 Customers
SELECT
CustomerID,
ROUND(SUM(Revenue), 2) AS Revenue,
COUNT(DISTINCT InvoiceNo) AS Orders
FROM ecommerce_sales
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 10;

#Repeat vs One-Time Customers

SELECT
Customer_Type,
COUNT(*) AS Customers
FROM (
SELECT
	CustomerID,
	CASE
		WHEN COUNT(DISTINCT InvoiceNo) > 1
		THEN 'Repeat Customer'
		ELSE 'One-Time Customer'
	END AS Customer_Type
FROM ecommerce_sales
GROUP BY CustomerID
) AS customer_type
GROUP BY Customer_Type;

#Category performance
SELECT
Category,
ROUND(SUM(Revenue), 2) AS Revenue,
SUM(Quantity) AS Quantity_Sold,
COUNT(DISTINCT InvoiceNo) AS Orders
FROM ecommerce_sales
GROUP BY Category
ORDER BY Revenue DESC;

#RFM based analysis
SELECT
CustomerID,
DATEDIFF((SELECT MAX(InvoiceDate) FROM ecommerce_sales),MAX(InvoiceDate)
) AS Recency,
COUNT(DISTINCT InvoiceNo) AS Frequency,
ROUND(SUM(Revenue), 2) AS Monetary
FROM ecommerce_sales
GROUP BY CustomerID;

#Monthly Growth
WITH monthly_revenue AS (
SELECT
DATE_FORMAT(InvoiceDate, '%Y-%m') AS YearMonth,
SUM(Revenue) AS Revenue
FROM ecommerce_sales
GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
)
SELECT
YearMonth,
ROUND(Revenue, 2) AS Revenue,
ROUND(
	(Revenue - LAG(Revenue) OVER (ORDER BY YearMonth))
	/ LAG(Revenue) OVER (ORDER BY YearMonth) * 100,2) AS MoM_Growth_Percent
FROM monthly_revenue
ORDER BY YearMonth;