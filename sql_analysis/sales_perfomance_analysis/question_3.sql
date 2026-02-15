-- What are the top 10 highest-value sales transactions?


SELECT 
    product_name,
    total_amount
FROM fact_sales_normalized AS fact
INNER JOIN dim_products as product
    ON fact.product_sk = product.product_sk
ORDER BY total_amount DESC
limit 10;