-- What is the total and average sales revenue by year, quarter, and month?

SELECT 
    EXTRACT(YEAR from sales_date) as year,
    EXTRACT(MONTH from sales_date) as month,
    EXTRACT(QUARTER from sales_date) as quarter,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS avg_revenue
FROM fact_sales_normalized
GROUP BY year, month, quarter