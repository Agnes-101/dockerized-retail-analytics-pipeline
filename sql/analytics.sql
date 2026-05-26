SELECT g.country, SUM(f.sales) AS total_sales
FROM fact_sales f
INNER JOIN dim_geography g
ON f.geography_id = g.geography_id
GROUP BY g.country
ORDER BY total_sales DESC
LIMIT 10;