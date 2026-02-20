-- Which campaigns should be repeated next year?


SELECT
    c.campaign_name,

    SUM(f.total_amount) AS revenue,
    c.campaign_budget AS cost,

    ROUND(
        (SUM(f.total_amount) - c.campaign_budget) * 100.0
        / c.campaign_budget,
        2
    ) AS roi_percentage
FROM dim_campaigns c
JOIN fact_sales_normalized f
    ON c.campaign_sk = f.campaign_sk
GROUP BY c.campaign_name, c.campaign_budget
ORDER BY roi_percentage DESC;

