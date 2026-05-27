TRUNCATE fact_sales,
         dim_customer,
         dim_product,
         dim_dates,
         dim_geography
RESTART IDENTITY CASCADE;

INSERT INTO dim_customer(
    customer_id,
    customer_first_name, 
    customer_last_name, 
    segment) 
SELECT DISTINCT
    customer_id, 
    customer_first_name, 
    customer_last_name, 
    segment
FROM staging_sales;

INSERT INTO dim_product(
    product_id, 
    product_name, 
    category, 
    sub_category) 
SELECT DISTINCT 
    product_id, 
    product_name, 
    category, 
    sub_category
FROM staging_sales;

INSERT INTO dim_dates (
    date_id,
    year,
    quarter,
    month,
    day
)
SELECT DISTINCT
    order_date::DATE,
    order_year,
    EXTRACT(QUARTER FROM order_date::DATE) AS order_quarter,
    order_month,
    order_day
FROM staging_sales
UNION
SELECT DISTINCT
    ship_date::DATE,
    ship_year,
    EXTRACT(QUARTER FROM ship_date::DATE) AS ship_quarter,
    ship_month,
    ship_day
FROM staging_sales;

INSERT INTO dim_geography (
    postal_code,
    city,
    country,
    state,
    region
) 
SELECT DISTINCT
    postal_code, city, country, state, region
FROM staging_sales;

INSERT INTO fact_sales (
    row_id,
    order_id,
    customer_id,
    product_key,
    order_date_id,
    shipping_date_id,
    geography_id,
    sales,
    quantity,
    discount,
    profit,
    profit_margin,
    shipping_days
) SELECT DISTINCT
    s.row_id,
    s.order_id,
    s.customer_id,
    p.product_key, -- join with dim_product to get surrogate key for fact table reference
    s.order_date::DATE, --appears as text in staging table, convert to date for fact table
    s.ship_date::DATE, --appears as text in staging table, convert to date for fact table
    g.geography_id,
    s.sales,
    s.quantity,
    s.discount,
    s.profit,
    s.profit_margin,
    s.shipping_days

FROM staging_sales s
JOIN dim_geography g 
ON s.postal_code = g.postal_code 
AND s.city = g.city 
AND s.country = g.country 
AND s.state = g.state 
AND s.region = g.region
JOIN dim_product p
ON s.product_id = p.product_id
AND s.product_name = p.product_name;