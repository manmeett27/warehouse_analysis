-- Who are the top 10 customers by total purchase value?


    SELECT 
        CONCAT(first_name, ' ', last_name) AS customer_name,
        AVG(fact.total_amount) AS total_avg_spend,
        SUM(fact.total_amount) AS total_spend
    FROM dim_customers as c
    INNER JOIN fact_sales_normalized as fact 
        ON c.customer_sk = fact.customer_sk
    GROUP BY CONCAT(first_name, ' ', last_name)
    ORDER BY total_spend DESC
    OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
