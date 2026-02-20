-- Which cities have the highest store revenue?


SELECT 
    ROUND(AVG(total_amount),2) AS result,
    store_location
FROM dim_stores as s
JOIN fact_sales_normalized as f
    ON s.store_sk=f.store_sk
GROUP BY store_location
LIMIT 5;