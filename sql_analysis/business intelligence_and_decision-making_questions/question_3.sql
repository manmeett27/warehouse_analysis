-- Which products should be discontinued?


WITH product_history AS (
    SELECT
        p.product_id,
        p.product_name,
        DATE_TRUNC('month', f.sales_date) AS month,
        SUM(f.total_amount) AS revenue
    FROM dim_products p
    JOIN fact_sales_normalized f
        ON p.product_sk = f.product_sk
    GROUP BY p.product_id, p.product_name, DATE_TRUNC('month', f.sales_date)
),

product_trends AS (
    SELECT
        product_id,
        product_name,

        AVG(revenue) AS avg_monthly_revenue,
        MIN(revenue) AS min_monthly_revenue
    FROM product_history
    GROUP BY product_id, product_name
)

SELECT *
FROM product_trends
WHERE avg_monthly_revenue < 1050000 
ORDER BY avg_monthly_revenue ASC;


