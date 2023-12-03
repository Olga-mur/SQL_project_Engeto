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

## Primární tabulka Table 1.sql

Při vytvoření tabulky č.1 se objevily následující úkoly

- sjednotit dvě tabulky "czechia_price" a "czechia_payroll" podle totožných porovnatelných období, přičemž v tabulce "czechia_price" jsou data ražena dle týdnů, v tabulce "czechia_payroll" rozdělení dat je provedeno dle kvartálů. Časovou základnou při seskupení dat byl vybrán kvartál. 
V tabulce "czechia_price" byly nalezeny položky, které se získaly na přelomu dvou kvartálů. Zde budeme předpokládat že v takových případech kvartál, pod který spadají příslušná data je kvartál hodnot "date_to".
 
- očistit tabulku o nepotřebná data, například mít k dispozici data o průměrné hrubé mzdě (tj. očistit o pozici "Příměrný počet zaměstnaných osob"), hodnoty mají být v korunách (nikoliv v tis. osob) a stejně tak i ve fyzických jednotkách (místo jednotky "přepočtený").
 


## Vedlejší tabulka Table 2.sql

Vedlejší tabulka je sestavena sjednocením dvou tabulek "economies" a "countries", přičemž tabulka "countries" je tabulka, na kterou se budou vázat údaje z tabulky "economies" protože v tabulce "economies" jsou zahrnuté informace nejen o státech ale také o větších skupinách států. 

Základním omezením pro výběrku dat budou dvě proměnné - kontinent "Europe" a období od 2006 do 2018 včetně (podle výše vymezeného požadavku stejného období jako primární tabulka pro ČR).


# Odpovědi na otázky

 


  