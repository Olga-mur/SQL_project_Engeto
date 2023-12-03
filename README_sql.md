# ENGETO SQL PROJEKT
---

# Struktura projektu

- sql fajly s tabulkami (Table 1.sql, Table 2.sql)
- sql fajly s odpovědi (Answer 1.sql, Answer 2.sql, Answer 3.sql, Answer 4.sql, Answer 5.sql)
- dokumentace (viz níže)


# Zadání projektu

Projekt představuje tvorbu dvou dílčích základních tabulek, data z kterých pomohou zodpovědět na 5 níže vypsaných dotazů.
Primární tabulka má obsahovat data mezd a cen potravin v České republice za stejné porovnatelné období, vedlejší tabulka se bude skládat z dat o HDP, GINI koeficientu a populaci v Evropských zemích (včetně České republiky) za stejné období jako primární tabulka.


Výzkumné otázky

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?


# Informace

# Popis dat

## Primární tabulka (Table 1.sql)

Při vytvoření tabulky č.1 se objevily následující úkoly

- sjednotit dvě tabulky "czechia_price" a "czechia_payroll" podle totožných porovnatelných období, přičemž v tabulce "czechia_price" jsou data ražena dle týdnů, v tabulce "czechia_payroll" rozdělení dat je provedeno dle kvartálů. Časovou základnou při seskupení dat byl vybrán kvartál. 
V tabulce "czechia_price" byly nalezeny položky, které se získaly na přelomu dvou kvartálů. Zde budeme předpokládat že v takových případech kvartál, pod který spadají příslušná data je kvartál hodnot "date_to".
 
- očistit tabulku o nepotřebná data, například mít k dispozici data o průměrné hrubé mzdě (tj. očistit o pozici "Příměrný počet zaměstnaných osob"), hodnoty mají být v korunách (nikoliv v tis. osob) a stejně tak i ve fyzických jednotkách (místo jednotky "přepočtený").
 


## Vedlejší tabulka (Table 2.sql)

Vedlejší tabulka je sestavena sjednocením dvou tabulek "economies" a "countries", přičemž tabulka "countries" je tabulka, na kterou se budou vázat údaje z tabulky "economies" protože v tabulce "economies" jsou zahrnuté informace nejen o státech ale také o větších skupinách států. 

Základním omezením pro výběrku dat budou dvě proměnné - kontinent "Europe" a období od 2006 do 2018 včetně (podle výše vymezeného požadavku stejného období jako primární tabulka pro ČR).


# Odpovědi na otázky

## Otázka č. 1 (Answer 1.sql) - Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

SQL dotaz má prozradit seznam odvětví, v nichž meziroční změna průměrné mzdy nabývá záporné nebo nulové hodnoty, a poté vyjmenovat odvětví, ve kterých průměrná mzda roste v průběhu let.

K tomu je použita tvorba dočasné tabulky pomocí operátoru "WITH" a propojovaní stejné tabulky přes operátor "JOIN" aby se daly zobrazit vedle sebe hodnoty průměrných mezd v konkrétním odvětví s časovým odstupem 1 rok. Dále je potřeba z původních dat primární tabulky zjistit možný výskyt nulových hodnot v sloupcích "industry_name" a "payroll_value". 

Výsledkem je seznam 14 odvětví ve kterých se vyskytuji poklesy v průměrných mzdách v průběhu let, a to jsou odvětví

1. Činnosti v oblasti nemovitostí
2. Informační a komunikační činnosti
3. Kulturní, zábavní a rekreační činnosti
4. Ostatní činnosti
5. Peněžnictví a pojišťovnictví
6. Profesní, vědecké a technické činnosti
7. Stavebnictví
8. Těžba a dobývání
9. Ubytování, stravování a pohostinství
10. Velkoobchod a maloobchod; opravy a údržba motorových vozidel
11. Veřejná správa a obrana; povinné sociální zabezpečení
12. Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu
13. Vzdělávání
14. Zásobování vodou; činnosti související s odpady a sanacemi


V ostatních 5 odvětvích (Administrativní a podpůrné činnosti; Doprava a skladování; Zdravotní a sociální péče; Zemědělství, lesnictví, rybářství a Zpracovatelský průmysl) průměrné mzdy v průběhu let rostou.  


## Otázka č. 2 (Answer 2.sql) - Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

Zaprvé se má zjistit jaké jsou první a poslední srovnatelné období, za které se budou porovnávat data u položek "Chléb konzumní kmínový" a "Mléko polotučné pasterované". Počátečním obdobím bude 1.kvartal 2006, konečným srovnatelným obdobím bude 4.kvartal roku 2018.

Dále je sestaven SQL dotaz určující množství litrů mléka a kilogramů chleba, které se dají koupit za průměrné ceny potravin a mezd v 1Q.2006 a 4Q.2018. Podle zobrazených čísel je zjevné že s postupem času roste množství mléka a chleba, takže lze řičí že průměrné mzdy v ČR rostly rychleji než se zvyšovaly průměrné ceny potravin, což pro obyvatele ČR je pozitivním zjištěním.  


## Otázka č. 3 (Answer 3.sql) - Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?


  