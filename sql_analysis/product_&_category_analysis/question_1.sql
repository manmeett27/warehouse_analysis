-- Which product categories generate the highest revenue?

SELECT 
    category,
    SUM(total_amount) AS revenue,
    AVG(total_amount) AS avg_sales
FROM dim_products as c
JOIN fact_sales_normalized as fact 
    ON c.product_sk = fact.product_sk 
GROUP BY category