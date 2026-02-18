-- What are the top 10 best-selling products?

SELECT
    product_name,
    MAX(fact.total_amount) as revenue
FROM dim_products as c
JOIN fact_sales_normalized as fact 
    ON c.product_sk = fact.product_sk 
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;