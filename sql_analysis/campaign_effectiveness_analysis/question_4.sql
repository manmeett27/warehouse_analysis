-- Which campaign has the longest active duration?


SELECT
    end_date_sk - start_date_sk as date_diff,
    campaign_name
FROM dim_campaigns
ORDER BY date_diff DESC