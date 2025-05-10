#  Retail Sales Data Analysis using MySQL

This project showcases end-to-end analysis of  retail sales data using MySQL. The goal is to clean, explore, and derive insights from real-world style transactional data as part of a professional data analytics portfolio.
 Tools Used

- **MySQL** (via MySQL Workbench)
- (Upcoming: Excel, Python, Power BI)

##  Dataset Description

The dataset simulates retail transactions with the following fields:

- `transaction_id`: Unique transaction reference
- `customer_id`: Unique customer identifier
- `category`: Product category (e.g., Electronics, Clothing)
- `item`: Specific item purchased
- `price_per_unit`: Cost of one item unit
- `quantity`: Units bought
- `total_spent`: Calculated total per transaction
- `payment_method`: How the payment was made
- `location`: Store location
- `transaction_date`: Date of transaction (text format)
- `discount_applied`: Whether a discount was applied

---

##  Data Cleaning in SQL

Key cleaning operations:

- Normalized inconsistent values (e.g., "creditcard", "Credit Card")
- Standardized product categories (`Electronics`, `Clothing`, etc.)
- Filled missing or blank values in `discount_applied` with `'Unknown'`
- Checked for duplicate `transaction_id` values
- Removed and re-added `temp_id` as an `AUTO_INCREMENT` field
- Created a new `clean_date` column using proper date parsing (attempted)

---

##  Data Exploration in SQL

Initial insights generated:

-  Total number of transactions
-  Unique values for `category`, `payment_method`, `discount_applied`
-  Total revenue across all transactions
-  Top 5 highest revenue-generating locations
-  Top 5 best-selling items by quantity
-  Missing value counts per column

 Duplicate transaction detection

---

##  Database & Table Setup

```sql
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

