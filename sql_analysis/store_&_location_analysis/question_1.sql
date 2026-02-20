-- Which store type generates maximum sales?


SELECT store_type,SUM(total_amount)
FROM dim_stores as s
JOIN fact_sales_normalized as f 
    ON s.store_sk = f.store_sk
GROUP BY store_type