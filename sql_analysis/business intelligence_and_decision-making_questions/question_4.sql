-- Where should new stores be opened?


SELECT
    s.store_location,
    COUNT(f.sales_id) AS total_orders,
    SUM(f.total_amount) AS total_revenue
FROM dim_stores s
JOIN fact_sales_normalized f
    ON s.store_sk = f.store_sk
GROUP BY s.store_location
ORDER BY total_revenue DESC;
