SELECT 
	t.food_name,	
	t.date_year,
	t2.date_year AS date_year2,
	t.average_price_value,
	t2.average_price_value,
	ROUND((t2.average_price_value - t.average_price_value)/t.average_price_value*100, 1) AS food_growth
FROM t_olga_murzinskaja_project_SQL_primary_final t 
JOIN t_olga_murzinskaja_project_SQL_primary_final t2
	ON t.date_year = t2.date_year - 1
	AND t.food_name = t2.food_name
GROUP BY date_year, food_name 
ORDER BY ROUND((t2.average_price_value - t.average_price_value)/t.average_price_value*100, 1) 
LIMIT 1;


