CREATE DATABASE retail_sales_db;
USE retail_sales_db;

CREATE TABLE retail_sales_raw (
    transaction_id VARCHAR(50),
    customer_id VARCHAR(50),
    category VARCHAR(100),
    item VARCHAR(100),
    price_per_unit DECIMAL(10,2),
    quantity INT,
    total_spent DECIMAL(10,2),
    payment_method VARCHAR(50),
    location VARCHAR(100),
    transaction_date VARCHAR(50), 
    discount_applied VARCHAR(10)  
);
SELECT * FROM retail_sales_raw LIMIT 10;

SELECT COUNT(*) FROM retail_sales_raw;
SELECT * FROM retail_sales_raw LIMIT 10;

SELECT transaction_id, COUNT(*) AS count
FROM retail_sales_raw
GROUP BY transaction_id
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS missing_count
FROM retail_sales_raw
WHERE customer_id IS NULL; 

SELECT DISTINCT payment_method FROM retail_sales_raw;

SELECT DISTINCT category FROM retail_sales_raw;

SELECT DISTINCT discount_applied FROM retail_sales_raw;

  -- Basic stats
SELECT SUM(total_spent) AS total_revenue FROM retail_sales_raw;

 -- Top 5 Locations by Sales:
 SELECT location, SUM(total_spent) AS revenue
FROM retail_sales_raw
GROUP BY location
ORDER BY revenue DESC
LIMIT 5;

 -- Most sold items
SELECT item, SUM(quantity) AS total_units
FROM retail_sales_raw
GROUP BY item
ORDER BY total_units DESC
LIMIT 5;

ALTER TABLE retail_sales_raw
ADD COLUMN temp_id INT AUTO_INCREMENT PRIMARY KEY;

UPDATE retail_sales_raw
SET payment_method = 'Credit Card'
WHERE payment_method IN ('CreditCard', 'creditcard', 'credit card');


UPDATE retail_sales_raw
SET category = 'Electronics'
WHERE LOWER(category) = 'electronics';

UPDATE retail_sales_raw
SET category = 'Groceries'
WHERE LOWER(category) = 'groceries';

UPDATE retail_sales_raw
SET category = 'Clothing'
WHERE LOWER(category) = 'clothing';

ALTER TABLE retail_sales_raw ADD COLUMN clean_date DATE;

UPDATE retail_sales_raw
SET clean_date = STR_TO_DATE(transaction_date, '%D-%m-%y');

ALTER TABLE retail_sales_raw
DROP COLUMN clean_date;

ALTER TABLE retail_sales_raw
DROP COLUMN temp_id;

ALTER TABLE retail_sales_raw
ADD COLUMN temp_id INT AUTO_INCREMENT FIRST;

-- Step 2: Add it again as the first column
ALTER TABLE retail_sales_raw
ADD COLUMN temp_id INT AUTO_INCREMENT PRIMARY KEY FIRST;

UPDATE retail_sales_raw
SET discount_applied = 'Unknown'
WHERE discount_applied IS NULL
   OR TRIM(discount_applied) = '';




























