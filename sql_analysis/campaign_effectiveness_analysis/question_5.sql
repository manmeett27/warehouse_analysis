SELECT
    CASE
        WHEN campaign_sk IS NULL THEN 'Without Campaign'
        ELSE 'With Campaign'
    END AS campaign_status,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_sales,
    ROUND(AVG(total_amount), 2) AS avg_order_value
FROM fact_sales_normalized
GROUP BY
    CASE
        WHEN campaign_sk IS NULL THEN 'Without Campaign'
        ELSE 'With Campaign'
    END;
