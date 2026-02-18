-- Which brands perform best in terms of sales?


SELECT 
    brand,
    COUNT(brand) as sales
FROM dim_products as c
GROUP BY brand
ORDER BY COUNT(brand) DESC
LIMIT 10;