CREATE TABLE t_olga_murzinskaja_project_SQL_primary_final AS
	SELECT 
		cp.id,
		cpay.payroll_year AS 'year',
		cpay.payroll_quarter AS 'quarter',
		cp.value AS food_price,
		cp.category_code AS food_category,
		cpc.name AS food_name,
		cpc.price_value AS food_value,
		cpc.price_unit AS food_unit,
		cp.region_code,
		cr.name AS region_name,
		cpay.value AS payroll_value,
		cpib.name AS industry_name,
		cpc2.name AS calculation_name,
		cpu.name AS unit_name,
		cpvt.name AS value_type_name
	FROM czechia_price cp 
	JOIN czechia_payroll cpay
		ON cpay.payroll_year = YEAR(cp.date_to) AND cpay.payroll_quarter = QUARTER(cp.date_to)
	LEFT JOIN czechia_price_category cpc
		ON cp.category_code = cpc.code
	LEFT JOIN czechia_payroll_industry_branch cpib
		ON cpay.industry_branch_code = cpib.code
	LEFT JOIN czechia_payroll_value_type cpvt 
		ON cpay.value_type_code = cpvt.code 
	LEFT JOIN czechia_payroll_unit cpu 
		ON cpay.unit_code = cpu.code 
	LEFT JOIN czechia_payroll_calculation cpc2 
		ON cpay.calculation_code = cpc2.code
	LEFT JOIN czechia_region cr 
		ON cp.region_code = cr.code
	WHERE cpay.value_type_code = 5958 
		AND cpay.unit_code = 200 
		AND cpay.calculation_code = 100;
