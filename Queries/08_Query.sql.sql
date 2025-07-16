WITH cte_price AS (
	SELECT 
		c.category_name,
		p.product_name,
		p.unit_price,
		ROUND(AVG(d.unit_price)::NUMERIC,2) AS average_unit_price,
		ROUND((PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY d.unit_price))::NUMERIC,2) AS median_unit_price
	FROM categories AS c
	INNER JOIN products AS p
	ON c.category_id = p.category_id
	INNER JOIN order_details AS d
	ON p.product_id = d.product_id
	WHERE p.discontinued = 0
	GROUP BY 
		c.category_name,
		p.product_name,
		p.unit_price
)
SELECT
	category_name, product_name, unit_price, average_unit_price, median_unit_price,
	CASE
		WHEN unit_price > average_unit_price THEN 'Over Average'
		WHEN unit_price = average_unit_price THEN 'Equal Average'
		WHEN unit_price < average_unit_price THEN 'Below Average'
	END AS average_unit_price_position,
	CASE
		WHEN unit_price > median_unit_price THEN 'Over Average'
		WHEN unit_price = median_unit_price THEN 'Equal Average'
		WHEN unit_price < median_unit_price THEN 'Below Average'
	END AS median_unit_price_position
FROM cte_price
ORDER BY 
	category_name ASC,
	product_name ASC;