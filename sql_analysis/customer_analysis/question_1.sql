-- Which customer segments generate the most revenue?


    SELECT 
        customer_segment,
        AVG(fact.total_amount) AS avg_total_revenue,
        SUM(fact.total_amount) AS total_revenue
    FROM dim_customers as c
    INNER JOIN fact_sales_normalized as fact 
        ON c.customer_sk = fact.customer_sk
    GROUP BY customer_segment
    ORDER BY total_revenue, avg_total_revenue DESC