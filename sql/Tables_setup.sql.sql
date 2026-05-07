CREATE DATABASE housing_project;
USE housing_project;

CREATE TABLE housing_data (
	country_code VARCHAR(10),
    country VARCHAR(50),
    year INT,
    nominal_house_price_index FLOAT,
    real_house_price_index FLOAT,
    rent_price_index FLOAT,
    price_to_income_ratio FLOAT,
    price_to_rent_ratio FLOAT,
    nominal_price_yoy_growth_pct FLOAT,
    real_price_yoy_growth_pct FLOAT,
    rent_yoy_growth_pct FLOAT,
    nominal_price_total_growth_pct FLOAT,
    rent_total_growth_pct FLOAT,
    average_annual_wage FLOAT,
    household_disposable_income FLOAT,
    interest_rate FLOAT,
    population FLOAT,
    housing_pressure FLOAT,
    true_affordability FLOAT,
    financing_pressure FLOAT,
    population_growth FLOAT,
    demand_pressure FLOAT
);

SELECT * FROM housing_data LIMIT 10;

CREATE TABLE investment_scores (
    country VARCHAR(50),
    investment_score FLOAT,
    future_growth_score FLOAT,
    final_score FLOAT,
    final_recommendation VARCHAR(50)
);

SELECT * FROM investment_scores LIMIT 10;

SELECT 
    h.country,
    h.year,
    h.nominal_house_price_index,
    i.final_score,
    i.final_recommendation
FROM housing_data h
JOIN investment_scores i
ON h.country = i.country;

