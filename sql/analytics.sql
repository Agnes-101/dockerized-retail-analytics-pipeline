SELECT g.state, g.country, SUM(f.sales) AS total_sales
FROM fact_sales f
INNER JOIN dim_geography g
ON f.geography_id = g.geography_id
GROUP BY g.state, g.country
ORDER BY total_sales DESC
LIMIT 10;

SELECT  d.quarter, ROUND(SUM(f.sales)::numeric, 2) AS total_sales
FROM fact_sales f
INNER JOIN dim_dates d
ON f.order_date_id = d.date_id
WHERE d.year = 2017
GROUP BY d.quarter
ORDER BY total_sales DESC;

SELECT p.category, ROUND(SUM(f.profit)::numeric, 2) AS total_profit
FROM fact_sales f
INNER JOIN dim_product p
ON f.product_key = p.product_key
GROUP BY p.category
ORDER BY total_profit DESC
LIMIT 5;

SELECT c.segment, ROUND(AVG(f.profit_margin)::numeric, 2) AS avg_profit_margin
FROM fact_sales f
INNER JOIN dim_customer c 
ON f.customer_id = c.customer_id
GROUP BY c.segment
ORDER BY avg_profit_margin DESC;

SELECT
    d.year,
    d.month,
    ROUND(SUM(f.sales)::NUMERIC, 2) AS monthly_sales
FROM fact_sales f
JOIN dim_dates d
ON f.order_date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

SELECT d.quarter, ROUND(AVG(f.profit_margin)::numeric, 2) AS avg_profit_margin
FROM fact_sales f
INNER JOIN dim_dates d
ON f.order_date_id = d.date_id
WHERE d.year = 2017
GROUP BY d.quarter
ORDER BY d.quarter;