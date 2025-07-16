SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_fullname,
	e.title AS employee_title,
	EXTRACT(YEAR FROM AGE(e.hire_date, e.birth_date))::INT AS employee_age,
	CONCAT(m.first_name, ' ', m.last_name) AS manager_full_name,
	m.title AS manager_title
FROM
    employees AS e
INNER JOIN employees AS m 
ON m.employee_id = e.reports_to
ORDER BY
    employee_age asc ,
	employee_fullname asc ;