SELECT
    ship_country AS Country,
    COUNT(DISTINCT order_id) AS Unique_Orders
FROM
    orders o
WHERE
    EXTRACT(YEAR FROM order_date) = 1998
GROUP BY
    ship_country
HAVING
    AVG(EXTRACT(DAY FROM AGE(shipped_date, order_date))) >=5
    AND COUNT(DISTINCT order_id) >10
ORDER BY
    Country,Unique_Orders asc;