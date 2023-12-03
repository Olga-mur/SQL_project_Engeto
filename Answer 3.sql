WITH food AS(
	SELECT
		food_name,
		`year`, 
		ROUND(avg(food_price),2) AS average_food_price
	FROM t_olga_murzinskaja_project_sql_primary_final tompspf
	WHERE food_name IS NOT NULL 
	GROUP BY food_name, `year`   
	HAVING avg(food_price)
)
SELECT 
	f.food_name,
	f.`year`, 
	f2.`year` AS year2, 
	f.average_food_price, 
	f2.average_food_price AS average_food_price2,
	round((f2.average_food_price - f.average_food_price) / f.average_food_price * 100, 2) AS food_growth
FROM food f
JOIN food f2
	ON f.`year` = f2.`year` - 1
	AND f.food_name = f2.food_name
WHERE round((f2.average_food_price - f.average_food_price) / f.average_food_price * 100, 2) > 0
ORDER BY round((f2.average_food_price - f.average_food_price) / f.average_food_price * 100, 2) ASC
LIMIT 1;