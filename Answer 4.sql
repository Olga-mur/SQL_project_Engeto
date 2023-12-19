WITH answer AS(
	SELECT 
		date_year, 
		ROUND(avg(average_payroll_value),1) AS avg_payvalue, 
		ROUND(avg(average_price_value),1) AS avg_privalue	
	FROM t_olga_murzinskaja_project_SQL_primary_final t 
	GROUP BY date_year
)
SELECT 
	a.date_year, 
	a2.date_year, 
	a.avg_payvalue, 
	a2.avg_payvalue, 
	a.avg_privalue, 
	a2.avg_privalue, 
	ROUND((a2.avg_payvalue-a.avg_payvalue)/a.avg_payvalue*100,1) AS payroll_diff, 
	ROUND((a2.avg_privalue-a.avg_privalue)/a.avg_privalue*100,1) AS price_diff, 
	ROUND(((a2.avg_privalue-a.avg_privalue)/a.avg_privalue*100-(a2.avg_payvalue-a.avg_payvalue)/a.avg_payvalue*100),1) AS final_diff
FROM answer a
JOIN answer a2
	ON a.date_year = a2.date_year - 1;