-- Which categories perform poorly and need improvement?


SELECT
    category,
    COUNT(category) as items_sold,
    SUM(total_amount) as revenue
FROM dim_products as c
JOIN fact_sales_normalized as fact 
    ON c.product_sk = fact.product_sk 
GROUP BY category
ORDER BY revenue ASC, items_sold ASC

