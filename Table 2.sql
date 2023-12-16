CREATE TABLE t_olga_murzinskaja_project_SQL_secondary_final AS
	SELECT 
		c.country,
		c.abbreviation,
		c.region_in_world,
		e.`year` AS date_year,
		e.GDP,
		e.gini,
		c.population AS polulation_economies, 
		e.population AS population_countries
	FROM countries c
	LEFT JOIN economies e 
	 ON c.country = e.country
	WHERE c.continent LIKE "Europe" AND e.`year` BETWEEN 2006 AND 2018;