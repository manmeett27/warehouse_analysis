-- Which underperforming stores need improvement?


WITH store_stats AS (
    SELECT
        s.store_id,
        s.store_name,
        COUNT(f.sales_id) AS total_orders,
        SUM(f.total_amount) AS total_revenue
    FROM dim_stores s
    JOIN fact_sales_normalized f
        ON s.store_sk = f.store_sk
    GROUP BY s.store_id, s.store_name
),

total_sales AS (
    SELECT SUM(total_revenue) AS company_revenue
    FROM store_stats
)

SELECT
    ss.store_id,
    ss.store_name,
    ss.total_orders,
    ss.total_revenue,

    ROUND(
        (ss.total_revenue * 100.0 / ts.company_revenue),
        2
    ) AS revenue_percentage
FROM store_stats ss
CROSS JOIN total_sales ts
ORDER BY ss.total_revenue ASC;

