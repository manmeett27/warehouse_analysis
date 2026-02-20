-- Is there a link between role and performance?


SELECT
    e.salesperson_role,
    COUNT(f.salesperson_sk) AS total_sales,
    SUM(f.total_amount) AS total_revenue,
    ROUND(AVG(f.total_amount), 2) AS avg_sale_value
FROM dim_salespersons AS e
JOIN fact_sales_normalized AS f
    ON e.salesperson_sk = f.salesperson_sk
GROUP BY e.salesperson_role
ORDER BY total_revenue DESC;
