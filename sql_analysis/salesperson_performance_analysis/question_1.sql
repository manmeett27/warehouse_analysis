-- Who are the top 10 salespersons by revenue?


SELECT
    salesperson_id,
    salesperson_name,
    SUM(total_amount) revenue
FROM dim_salespersons s
JOIN fact_sales_normalized f ON s.salesperson_sk = f.salesperson_sk
GROUP BY salesperson_name, salesperson_id
ORDER BY revenue DESC
LIMIT 10;