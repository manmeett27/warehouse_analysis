-- Which salesperson has the highest number of transactions?


SELECT
    salesperson_name,
    COUNT(f.salesperson_sk) total_transaction
FROM dim_salespersons s
JOIN fact_sales_normalized f ON s.salesperson_sk = f.salesperson_sk
GROUP BY salesperson_name
ORDER BY total_transaction DESC