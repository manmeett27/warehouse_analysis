-- Which customer segment should be targeted for marketing?


-- First, analyze how each segment is performing.
SELECT
    c.customer_segment,
    COUNT(f.sales_id) AS total_orders,
    SUM(f.total_amount) AS total_revenue,
    ROUND(AVG(f.total_amount), 2) AS avg_order_value
FROM dim_customers c
JOIN fact_sales_normalized f
    ON c.customer_sk = f.customer_sk
GROUP BY c.customer_segment
ORDER BY total_revenue DESC;

-- Target segments with below-average revenue:
WITH segment_stats AS (
    SELECT
        c.customer_segment,
        SUM(f.total_amount) AS revenue
    FROM dim_customers c
    JOIN fact_sales_normalized f
        ON c.customer_sk = f.customer_sk
    GROUP BY c.customer_segment
)

SELECT *
FROM segment_stats
WHERE revenue < (SELECT AVG(revenue) FROM segment_stats)
ORDER BY revenue ASC;

-- Sometimes customers spend a lot, but buy rarely → good for remarketing.
SELECT
    c.customer_segment,
    COUNT(*) AS total_orders,
    ROUND(AVG(f.total_amount), 2) AS avg_order_value
FROM dim_customers c
JOIN fact_sales_normalized f
    ON c.customer_sk = f.customer_sk
GROUP BY c.customer_segment
ORDER BY avg_order_value DESC, total_orders ASC;

-- Segments with high campaign revenue respond well to marketing.
SELECT
    c.customer_segment,
    COUNT(*) AS total_orders,
    SUM(
        CASE WHEN f.campaign_sk IS NOT NULL
             THEN f.total_amount ELSE 0 END
    ) AS campaign_revenue
FROM dim_customers c
JOIN fact_sales_normalized f
    ON c.customer_sk = f.customer_sk
GROUP BY c.customer_segment
ORDER BY campaign_revenue DESC;
