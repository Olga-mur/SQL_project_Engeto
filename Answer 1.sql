WITH answer1 AS (
		SELECT 
			t.industry_name,
			t.date_year,
			t2.date_year AS date_year2,
			t.average_payroll_value, 
			t2.average_payroll_value AS average_payroll_value2,
			ROUND((t2.average_payroll_value - t.average_payroll_value)/t.average_payroll_value * 100, 1) AS payroll_growth
		FROM t_olga_murzinskaja_project_SQL_primary_final t  
		JOIN t_olga_murzinskaja_project_SQL_primary_final t2
			ON t.date_year = t2.date_year - 1
			AND t.industry_name = t2.industry_name
		WHERE ROUND((t2.average_payroll_value - t.average_payroll_value)/t.average_payroll_value * 100, 1) <= 0	
		GROUP BY t.industry_name, t.date_year
)
SELECT DISTINCT industry_name
FROM answer1;

