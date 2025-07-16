WITH cte_freight AS (
	SELECT
		CONCAT(EXTRACT(YEAR FROM order_date), 
			   '-', 
			   EXTRACT(MONTH FROM order_date), 
			   '-01'
			  ) AS year_month,
		COUNT(*) AS total_number_orders,
		ROUND(
			SUM(freight)
			)::INT AS total_freight
	FROM orders
	WHERE order_date >= '1997-01-01' AND order_date < '1998-12-31'
	GROUP BY 
		CONCAT(EXTRACT(YEAR FROM order_date), 
			   '-', 
			   EXTRACT(MONTH FROM order_date), 
			   '-01'
			  )
)
SELECT * FROM cte_freight
WHERE total_number_orders > 35
ORDER BY total_freight DESC;