-- Which store managers handle the best-performing stores?


SELECT 
    store_id,
    store_name,
    s.salesperson_name,
    SUM(total_amount) as revenue
FROM dim_stores as st
JOIN dim_salespersons as s
    ON st.store_manager_sk = s.salesperson_sk
JOIN fact_sales_normalized as f
    ON st.store_sk = f.store_sk
GROUP BY store_id, s.salesperson_name, store_name,st.store_manager_sk
ORDER BY SUM(total_amount) DESC