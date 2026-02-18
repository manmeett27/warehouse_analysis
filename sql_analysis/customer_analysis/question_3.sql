-- Which cities have the highest number of high-value customers?


    SELECT 
        residential_location,
        COUNT(customer_id) as total_order,
        AVG(fact.total_amount) AS total_avg_spend
    FROM dim_customers as c
    INNER JOIN fact_sales_normalized as fact 
        ON c.customer_sk = fact.customer_sk
    GROUP BY residential_location
    ORDER BY total_avg_spend DESC
    LIMIT 10