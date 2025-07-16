WITH cte_kpi AS (
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_full_name,
	e.title AS employee_title,
	ROUND(
		SUM(d.quantity * d.unit_price)::NUMERIC,
		2) AS total_sale_amount_excluding_discount,
    COUNT(DISTINCT d.order_id) AS total_number_orders,
    COUNT(d.*) AS total_number_entries,
		ROUND(
		SUM(d.discount*(d.quantity * d.unit_price))::NUMERIC,
		2) AS total_discount_amount,
	ROUND(
		SUM((1 - d.discount)*(d.quantity * d.unit_price))::NUMERIC,
		2) AS total_sale_amount_including_discount
FROM orders AS o
INNER JOIN employees AS e
ON o.employee_id = e.employee_id
INNER JOIN order_details AS d
ON d.order_id = o.order_id
INNER JOIN products AS p
ON d.product_id = p.product_id
GROUP BY 
	employee_full_name, employee_title
)
SELECT 
	employee_full_name, employee_title, total_sale_amount_excluding_discount, total_number_orders, total_number_entries,
	ROUND(
		SUM(total_sale_amount_excluding_discount/total_number_entries),
		   2) AS average_amount_per_entry,
	ROUND(
		SUM(total_sale_amount_excluding_discount/total_number_orders),
		   2) AS average_amount_per_order, total_discount_amount, total_sale_amount_including_discount,
	SUM(ROUND(
		(total_sale_amount_excluding_discount-total_sale_amount_including_discount)/total_sale_amount_excluding_discount*100,
		2)) AS total_discount_percentage
FROM cte_kpi
GROUP BY
	employee_full_name, employee_title, total_sale_amount_excluding_discount, total_number_orders, total_number_entries, total_sale_amount_including_discount, total_discount_amount
ORDER BY total_sale_amount_including_discount DESC;