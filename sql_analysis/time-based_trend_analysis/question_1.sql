-- What is the quarter-wise growth rate in sales?


SELECT
    quarter,
    SUM(total_amount) revenue
FROM dim_dates d
JOIN fact_sales_normalized f ON d.full_date = f.sales_date
GROUP BY quarter