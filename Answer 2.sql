SELECT 
	date_year, 
	average_payroll_value,
	ROUND(avg(average_payroll_value),1) AS avg_payroll_value, 
	food_name,  
	average_price_value, 
	ROUND(avg(average_price_value),1) AS avg_price_value,
	ROUND(avg(average_payroll_value)/avg(average_price_value),1) AS quantity	
FROM t_olga_murzinskaja_project_SQL_primary_final t 
WHERE food_category IN ("114201", "111301") 
AND date_year IN ("2006", "2018")
GROUP BY date_year, food_name  
HAVING avg(average_payroll_value) AND avg(average_price_value)
ORDER BY date_year;
