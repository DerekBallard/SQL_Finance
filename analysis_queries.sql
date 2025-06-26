-- Active: 1738088069495@@localhost@3306@bank_db
-- 1. Average balance by region
SELECT COUNT(*) FROM customers;

SHOW TABLES;
SELECT region, ROUND(AVG(balance), 2) AS avg_balance
FROM customers
GROUP BY region
ORDER BY avg_balance DESC;

-- 2. Count of customers by job classification
SELECT job_classification, COUNT(*) AS customer_count
FROM customers
GROUP BY job_classification
ORDER BY customer_count DESC;

-- 3. Average age and balance by gender
SELECT gender, AVG(age) AS avg_age, ROUND(AVG(balance), 2) AS avg_balance
FROM customers
GROUP BY gender;

-- 4. Top 3 customers with the highest balance
SELECT first_name, last_name, balance
FROM customers
ORDER BY balance DESC
LIMIT 3;

-- 5. Customers who joined before Jan 10, 2015
SELECT first_name, last_name, date_joined
FROM customers
WHERE date_joined < '2015-01-10'
ORDER BY date_joined;

-- 6. SQLite does not support CREATE OR REPLACE VIEW, so drop first (optional)
DROP VIEW IF EXISTS high_value_customers;

CREATE VIEW high_value_customers AS
SELECT customer_id, first_name, last_name, region, balance
FROM customers
WHERE balance > 75000;

-- 7. Age group classification
SELECT *,
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 45 THEN '30-45'
        ELSE '46+'
    END AS age_group
FROM customers;

-- 8. Count of high value customers by region
SELECT region, COUNT(*) AS high_value_count
FROM high_value_customers
GROUP BY region;
