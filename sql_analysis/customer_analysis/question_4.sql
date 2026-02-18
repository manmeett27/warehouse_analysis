-- What percentage of customers belong to the Churn Risk segment?

SELECT 
    ROUND(
        (SUM(CASE 
            WHEN customer_segment = 'Churn Risk' THEN 1 
            ELSE 0 
         END) * 100.0) / COUNT(*),
        2
    ) AS churn_risk_percentage
FROM dim_customers;
