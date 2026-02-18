-- How often do first-time buyers make repeat purchases?


WITH customer_purchases AS (
    SELECT 
        customer_sk,
        COUNT(*) AS total_purchases,
        MIN(sales_date) AS first_purchase_date
    FROM fact_sales_normalized
    GROUP BY customer_sk
)

SELECT 
    COUNT(CASE WHEN total_purchases > 1 THEN 1 END) AS repeat_customers,
    COUNT(*) AS first_time_customers,
    
    ROUND(
        COUNT(CASE WHEN total_purchases > 1 THEN 1 END) * 100.0 
        / COUNT(*),
        2
    ) AS repeat_purchase_percentage

FROM customer_purchases;
