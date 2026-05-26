DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_customer;
DROP TABLE IF EXISTS dim_product;   
DROP TABLE IF EXISTS dim_dates;
DROP TABLE IF EXISTS dim_geography; 

CREATE TABLE dim_customer (
    customer_id VARCHAR(8) PRIMARY KEY,
    customer_first_name VARCHAR(255) NOT NULL,
    customer_last_name VARCHAR(255) NOT NULL,
    segment VARCHAR(50)
    );

CREATE TABLE dim_product (
    product_id VARCHAR(15) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(50),
    sub_category TEXT
    );  

CREATE TABLE dim_dates (
    date_id DATE PRIMARY KEY,
    year INT,
    quarter INT,
    month INT,
    day INT
    );

CREATE TABLE dim_geography (
    geography_id SERIAL PRIMARY KEY,
    postal_code INT,
    city VARCHAR(50),
    country VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50)
    );

CREATE TABLE fact_sales (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(14),
    customer_id VARCHAR(8),
    product_id VARCHAR(15),
    order_date_id DATE,
    shipping_date_id DATE,
    geography_id INT,

    sales FLOAT,
    quantity INT,
    discount FLOAT,
    profit FLOAT,
    profit_margin FLOAT,
    shipping_days INT,

    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id), 
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (order_date_id) REFERENCES dim_dates(date_id),
    FOREIGN KEY (shipping_date_id) REFERENCES dim_dates(date_id),
    FOREIGN KEY (geography_id) REFERENCES dim_geography(geography_id)
    );  