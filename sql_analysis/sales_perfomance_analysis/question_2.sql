-- Which month in 2024 generated the highest total sales?

SELECT 
    EXTRACT(MONTH from sales_date) as month,
    SUM(total_amount) AS total_revenue
FROM fact_sales_normalized
WHERE EXTRACT(YEAR from sales_date) = '2024'
GROUP BY month
order BY total_revenue DESC
limit 1;