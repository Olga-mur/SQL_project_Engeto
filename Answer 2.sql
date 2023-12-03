SELECT `year` , quarter, food_name  
FROM t_olga_murzinskaja_project_sql_primary_final tompspf
WHERE food_name LIKE "Mléko polotučné pasterované" OR food_name LIKE "Chléb konzumní kmínový"
GROUP BY `year`, quarter, food_name 
ORDER BY `year` ASC, quarter ASC;


SELECT 
	`year`, 
	quarter, 
	round(avg(food_price),2) AS avg_food_price, 
	food_name,  
	round(avg(payroll_value),2) AS avg_payroll_value, 
	unit_name, 
	ROUND(avg(payroll_value)/avg(food_price),0) AS quantity
FROM t_olga_murzinskaja_project_sql_primary_final tompspf
WHERE (food_name LIKE "Mléko polotučné pasterované" OR food_name LIKE "Chléb konzumní kmínový") 
AND ((`year` = "2006" AND quarter = "1") OR (`year` = "2018" AND quarter = "4"))
GROUP BY `year`, quarter, food_name  
ORDER BY `year`, quarter;