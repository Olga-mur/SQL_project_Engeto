WITH secondt AS (
	SELECT 
		date_year,
		GDP,
		population_countries 
	FROM t_olga_murzinskaja_project_sql_secondary_final ts 
	WHERE country LIKE 'Czech Republic'
),
firstt AS(
	SELECT 
		date_year,
		ROUND(avg(average_price_value),1) AS avg_food_price, 
		ROUND(avg(average_payroll_value),1) AS avg_payroll_value
	FROM t_olga_murzinskaja_project_SQL_primary_final tp  	
	GROUP BY date_year
	HAVING avg(average_price_value) AND avg(average_payroll_value)
)
SELECT 
	s.date_year,
	s2.date_year AS date_year2,
	s.GDP,
	s2.GDP AS GDP2,
	f.avg_food_price,
	f2.avg_food_price AS avg_food_price2,
	f.avg_payroll_value,
	f2.avg_payroll_value AS avg_payroll_value2,
	ROUND((s2.GDP - s.GDP) / s.GDP * 100, 1) AS GDP_growth,
	ROUND((f2.avg_food_price - f.avg_food_price) / f.avg_food_price * 100, 1) AS food_growth,
	ROUND((f2.avg_payroll_value - f.avg_payroll_value) / f.avg_payroll_value * 100, 1) AS payroll_growth
FROM secondt s
JOIN firstt f	
	ON s.date_year = f.date_year
JOIN secondt s2
	ON s.date_year = s2.date_year - 1
JOIN firstt f2
	ON f.date_year = f2.date_year - 1;


