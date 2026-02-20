-- Which campaigns perform best for each customer segment?

WITH campaign AS (
    SELECT
        customer_segment,
        campaign_name,
        SUM(total_amount) revenue
    FROM dim_campaigns ca
    JOIN fact_sales_normalized f 
        ON ca.campaign_sk = f.campaign_sk
    JOIN dim_customers c 
        ON f.customer_sk = c.customer_sk
    GROUP BY customer_segment,campaign_name
),

ranked_campaigns AS (
    SELECT *,
           RANK() OVER (
               PARTITION BY customer_segment
               ORDER BY revenue DESC
           ) AS rank_no
    FROM campaign
)

SELECT 
    customer_segment,
    campaign_name,
    revenue
FROM ranked_campaigns
WHERE rank_no = 1;