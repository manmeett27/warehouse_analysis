-- Which season shows the highest demand?


SELECT
    CASE
        WHEN quarter = 1 THEN 'Winter'
        WHEN quarter = 2 THEN 'Spring'
        WHEN quarter = 3 THEN 'Summer'
        WHEN quarter = 4 THEN 'Autumn'
    END as season,
    COUNT(*) total_order,
    SUM(total_amount) revenue
FROM dim_dates d
JOIN fact_sales_normalized f ON d.full_date = f.sales_date
GROUP BY quarter
ORDER BY revenue DESC