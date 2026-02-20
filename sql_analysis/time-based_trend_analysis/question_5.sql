-- Are there any periods of sales decline?


WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', full_date) AS month,
        SUM(total_amount) AS revenue
    FROM dim_dates d
    JOIN fact_sales_normalized f
        ON d.full_date = f.sales_date
    GROUP BY DATE_TRUNC('month', full_date)
),

sales_with_lag AS (
    SELECT
        month,
        revenue,
        LAG(revenue) OVER (ORDER BY month) AS prev_revenue
    FROM monthly_sales
)

SELECT
    month,
    revenue,
    prev_revenue,
    ROUND(
        (revenue - prev_revenue) * 100.0 / prev_revenue,
        2
    ) AS growth_percentage
FROM sales_with_lag
WHERE revenue < prev_revenue
ORDER BY month;
