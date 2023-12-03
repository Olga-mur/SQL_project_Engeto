SELECT DISTINCT industry_name
FROM t_olga_murzinskaja_project_sql_primary_final tompspf
WHERE industry_name IS NOT NULL
ORDER BY industry_name;


WITH odvetvi AS(
	SELECT
		industry_name,
		`year`, 
		ROUND(avg(payroll_value),0) AS average_payroll_value
	FROM t_olga_murzinskaja_project_sql_primary_final tompspf
	WHERE industry_name IS NOT NULL AND payroll_value IS NOT NULL 
	GROUP BY industry_name, `year`   
	HAVING avg(payroll_value)
)
SELECT 
	odv.industry_name,
	odv.`year`, 
	odv2.`year` AS year2, 
	odv.average_payroll_value, 
	odv2.average_payroll_value AS average_payroll_value2,
	round((odv2.average_payroll_value - odv.average_payroll_value) / odv.average_payroll_value * 100, 2) AS payroll_growth 
FROM odvetvi odv
JOIN odvetvi odv2
	ON odv.`year` = odv2.`year` - 1
	AND odv.industry_name = odv2.industry_name
WHERE round((odv2.average_payroll_value - odv.average_payroll_value) / odv.average_payroll_value * 100, 2) <= 0
GROUP BY odv.industry_name
ORDER BY odv.industry_name ASC, odv.`year` ASC;
