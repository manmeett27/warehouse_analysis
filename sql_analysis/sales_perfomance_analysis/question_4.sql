-- How does weekday vs weekend sales performance compare?

SELECT 
    EXTRACT(MONTH FROM sales_date) as month,
    CASE 
        WHEN EXTRACT(DOW FROM sales_date) IN (0,6)
            THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    SUM(total_amount) AS total_revenue
FROM fact_sales_normalized
GROUP BY day_type,month
ORDER BY month, day_type