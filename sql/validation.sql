SELECT COUNT(*)
FROM fact_sales f
LEFT JOIN dim_customer c
ON f.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT COUNT(*)
FROM fact_sales f
LEFT JOIN dim_product p
ON f.product_key = p.product_key
WHERE p.product_key IS NULL;

SELECT COUNT(*)
FROM fact_sales f
LEFT JOIN dim_geography g
ON f.geography_id = g.geography_id
WHERE g.geography_id IS NULL;

SELECT COUNT(*)
FROM fact_sales f
LEFT JOIN dim_dates d
ON f.order_date_id = d.date_id
WHERE d.date_id IS NULL;

