CREATE TABLE t_olga_murzinskaja_project_SQL_primary_final AS
	SELECT 
		cpay.payroll_year AS date_year,
		cpib.name AS industry_name,
		ROUND(avg(cpay.value),1) AS average_payroll_value,
		cpc.name AS food_name,
		cp.category_code AS food_category,
		ROUND(avg(cp.value),1) AS average_price_value
	FROM czechia_price cp 
	JOIN czechia_payroll cpay
		ON cpay.payroll_year = YEAR(cp.date_to)
	LEFT JOIN czechia_price_category cpc
		ON cp.category_code = cpc.code
	LEFT JOIN czechia_payroll_industry_branch cpib
		ON cpay.industry_branch_code = cpib.code
	WHERE cpay.value_type_code = 5958 
		AND cpay.unit_code = 200 
		AND cpay.calculation_code = 100
		AND cpib.name IS NOT NULL 
		AND cp.value IS NOT NULL
		AND cpay.value IS NOT NULL
	GROUP BY cpay.payroll_year, cpc.name, cpib.name
	HAVING avg(cp.value) AND avg(cpay.value);


	


