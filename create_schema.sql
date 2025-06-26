-- Active: 1738088069495@@localhost@3306@mysql
DROP TABLE IF EXISTS orders;

-- Now drop the customers table safely
DROP TABLE IF EXISTS customers;

-- Recreate customers table
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    gender TEXT,
    age INTEGER,
    region TEXT,
    job_classification TEXT,
    date_joined DATE,
    balance REAL
);