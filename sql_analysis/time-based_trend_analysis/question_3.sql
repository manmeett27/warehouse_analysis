-- How do sales vary across weekdays?


SELECT
    TO_CHAR(full_date, 'Day') AS weekday,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS avg_order_value
FROM dim_dates d
JOIN fact_sales_normalized f ON d.full_date = f.sales_date
GROUP BY TO_CHAR(full_date, 'Day'), EXTRACT(DOW FROM full_date)
ORDER BY EXTRACT(DOW FROM full_date);
