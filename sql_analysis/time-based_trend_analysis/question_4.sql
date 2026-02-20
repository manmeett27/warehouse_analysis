-- What is the monthly sales growth percentage?


WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', full_date) AS month,
        SUM(total_amount) AS revenue
    FROM dim_dates d
    JOIN fact_sales_normalized f ON d.full_date = f.sales_date
    GROUP BY DATE_TRUNC('month', full_date)
)

SELECT
    month,
    revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month)) * 100.0
        / LAG(revenue) OVER (ORDER BY month),
        2
    ) AS growth_percentage
FROM monthly_sales
ORDER BY month;
