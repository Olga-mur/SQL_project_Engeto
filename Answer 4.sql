WITH compare AS(
	SELECT 
		`year`, 
		ROUND(avg(food_price),2) AS average_food_price, 
		ROUND(avg(payroll_value),2) AS average_payroll_value
	FROM t_olga_murzinskaja_project_sql_primary_final tompspf
	GROUP BY `year`
	HAVING avg(food_price) AND avg(payroll_value)
)
SELECT 
	c.`year`,
	c2.`year` AS year2,
	c.average_food_price,
	c2.average_food_price AS average_food_price2,
	round((c2.average_food_price - c.average_food_price) / c.average_food_price * 100, 2) AS food_growth,
	c.average_payroll_value,
	c2.average_payroll_value AS average_payroll_value2,
	round((c2.average_payroll_value - c.average_payroll_value) / c.average_payroll_value * 100, 2) AS payroll_growth,
	round((c2.average_food_price - c.average_food_price) / c.average_food_price * 100, 2) - round((c2.average_payroll_value - c.average_payroll_value) / c.average_payroll_value * 100, 2) AS difference
FROM compare c
JOIN compare c2
	ON c.`year` = c2.`year` - 1
WHERE round((c2.average_food_price - c.average_food_price) / c.average_food_price * 100, 2) >= 0 
	AND round((c2.average_payroll_value - c.average_payroll_value) / c.average_payroll_value * 100, 2) >= 0 
ORDER BY difference DESC;