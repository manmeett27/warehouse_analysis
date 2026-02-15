-- How does weekday vs weekend sales performance compare?

SELECT 
    d.day_type,
    SUM(f.total_amount) AS total_sales
FROM fact_sales_normalized as f
inner JOIN dim_dates d ON f.sales_date = d.full_date
GROUP BY d.day_type;
