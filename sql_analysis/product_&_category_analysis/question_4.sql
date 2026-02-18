-- Which product origins (cities) contribute most to revenue?

SELECT
    c.origin_location as origins,
    SUM(total_amount) AS revenue
FROM dim_products as c
JOIN fact_sales_normalized as fact 
    ON c.product_sk = fact.product_sk 
GROUP BY origin_location
ORDER BY revenue DESC
LIMIT 10;

