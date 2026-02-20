-- What is the ROI of each campaign (Sales ÷ Budget)?


SELECT
    campaign_name,
    ROUND(sum(total_amount)/campaign_budget) as roi
FROM dim_campaigns c
JOIN fact_sales_normalized f ON c.campaign_sk = f.campaign_sk
GROUP BY campaign_budget, campaign_name