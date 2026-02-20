-- Which marketing campaign generated the highest revenue?

SELECT 
    campaign_name,
    SUM(total_amount) as revenue
FROM dim_campaigns as c
JOIN fact_sales_normalized as f ON c.campaign_sk = f.campaign_sk
GROUP BY campaign_name
ORDER BY SUM(total_amount) DESC