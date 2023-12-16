SELECT 
	t.date_year,
	t2.date_year AS date_year2,
	t.average_price_value,
	t2.average_price_value AS average_price_value2,
	ROUND((t2.average_price_value - t.average_price_value)/t.average_price_value * 100, 1) AS food_growth,
	t.average_payroll_value,
	t2.average_payroll_value AS average_payroll_value2,
	ROUND((t2.average_payroll_value - t.average_payroll_value)/t.average_payroll_value * 100, 1) AS payroll_growth,
	ROUND((t2.average_price_value - t.average_price_value)/t.average_price_value * 100, 1) - ROUND((t2.average_payroll_value - t.average_payroll_value)/t.average_payroll_value * 100, 1) AS difference
FROM t_olga_murzinskaja_project_SQL_primary_final t 
JOIN t_olga_murzinskaja_project_SQL_primary_final t2
	ON t.date_year = t2.date_year - 1
GROUP BY date_year
ORDER BY ROUND((t2.average_price_value - t.average_price_value)/t.average_price_value * 100, 1) - ROUND((t2.average_payroll_value - t.average_payroll_value)/t.average_payroll_value * 100, 1) DESC 
LIMIT 1; 
