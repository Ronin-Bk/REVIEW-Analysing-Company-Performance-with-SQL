WITH cte_kpi AS (
SELECT
    c.category_name,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_full_name,
    ROUND(
		  SUM(d.quantity * d.unit_price)::NUMERIC,
		  2) AS total_sale_amount_including_discount
FROM employees AS e
INNER JOIN orders AS o
	ON e.employee_id = o.employee_id 
INNER JOIN order_details AS d
	ON o.order_id = d.order_id
INNER JOIN products AS p
	ON d.product_id = p.product_id
INNER JOIN categories AS c
	ON c.category_id = p.category_id
GROUP BY 
	category_name,
	employee_full_name
)
SELECT 
	*,
	ROUND(
		SUM(total_sale_amount_including_discount) / SUM(SUM(total_sale_amount_including_discount))
			OVER (PARTITION BY employee_full_name) * 100,
		2) AS percentage_of_employee_sales,
	ROUND(	
		SUM(total_sale_amount_including_discount) / SUM(SUM(total_sale_amount_including_discount))
			OVER (PARTITION BY category_name) * 100,
		2) AS percentage_of_category_sales
FROM cte_kpi
GROUP BY
	category_name, employee_full_name, total_sale_amount_including_discount
ORDER BY
	category_name ASC,
	total_sale_amount_including_discount DESC;