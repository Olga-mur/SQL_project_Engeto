WITH czech AS(
	SELECT 
		`year` ,
		GDP,
		population_countries 
	FROM t_olga_murzinskaja_project_sql_secondary_final tompssf 
	WHERE country LIKE 'Czech Republic'
),
compare AS(
	SELECT 
		`year`,
		ROUND(avg(food_price),2) AS average_food_price, 
		ROUND(avg(payroll_value),2) AS average_payroll_value
	FROM t_olga_murzinskaja_project_sql_primary_final tompspf 	
	GROUP BY `year`
	HAVING avg(food_price) AND avg(payroll_value)
)
SELECT 
	cz.`year`,
	cz2.`year` AS year2,
	cz.GDP,
	cz2.GDP AS GDP2,
	c.average_food_price,
	c2.average_food_price AS average_food_price2,
	c.average_payroll_value,
	c2.average_payroll_value AS average_payroll_value2,
	round((cz2.GDP - cz.GDP) / cz.GDP * 100, 2) AS GDP_growth,
	round((c2.average_food_price - c.average_food_price) / c.average_food_price * 100, 2) AS food_growth,
	round((c2.average_payroll_value - c.average_payroll_value) / c.average_payroll_value * 100, 2) AS payroll_growth
FROM czech cz
JOIN compare c	
	ON cz.`year` = c.`year`
JOIN czech cz2
	ON cz.`year` = cz2.`year` - 1
JOIN compare c2
	ON c.`year` = c2.`year` - 1;