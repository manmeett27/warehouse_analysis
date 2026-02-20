-- What is the average sales per employee?


SELECT
    salesperson_id,
    salesperson_name,
    ROUND(AVG(total_amount),2) revenue
FROM dim_salespersons s
JOIN fact_sales_normalized f ON s.salesperson_sk = f.salesperson_sk
GROUP BY salesperson_name, salesperson_id
ORDER BY revenue DESC