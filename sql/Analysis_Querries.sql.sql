-- ============================================
-- ANALYSIS 1: TOP INVESTMENT COUNTRIES
-- ============================================
-- Question: Which European countries offer the best overall investment opportunities based on the final model?

SELECT 
    country, 
    final_score,
    final_recommendation
FROM investment_scores
ORDER BY final_score DESC;

-- ============================================
-- ANALYSIS 2: MOST AFFORDABLE COUNTRIES
-- ============================================
-- Question: Which countries have the most affordable housing relative to income?

SELECT 
    country, 
    AVG(price_to_income_ratio) AS avg_price_to_income_ratio
FROM housing_data
GROUP BY country
ORDER BY avg_price_to_income_ratio ASC;

-- ============================================
-- ANALYSIS 3: HIGHEST GROWTH MARKETS
-- ============================================
-- Question: Which countries have experienced the highest housing price levels (growth potential indicator)?

SELECT 
    country, 
    MAX(nominal_house_price_index) AS max_price_index
FROM housing_data
GROUP BY country
ORDER BY max_price_index DESC;

-- ============================================
-- ANALYSIS 4: STRONG DEMAND COUNTRIES
-- ============================================
-- Question: Which countries show the strongest population growth, indicating housing demand?

SELECT 
    country, 
    AVG(population_growth) AS avg_population_growth
FROM housing_data
GROUP BY country
ORDER BY avg_population_growth DESC;

-- ============================================
-- ANALYSIS 5: BEST BALANCED MARKETS
-- ============================================
-- Question: Which countries offer the best balance between affordability, interest rates, and investment attractiveness?

SELECT 
    h.country,
    h.affordability,
    h.avg_interest_rate,
    i.final_score
FROM (
    SELECT 
        country,
        AVG(price_to_income_ratio) AS affordability,
        AVG(interest_rate) AS avg_interest_rate
    FROM housing_data
    GROUP BY country
) h
JOIN investment_scores i
ON h.country = i.country
ORDER BY i.final_score DESC;


### Handling GROUP BY in SQL
-- In this project, an issue occurred when combining aggregated housing metrics with non-aggregated investment scores. This was resolved using a subquery to first compute country-level averages and then joining the result with the investment score table.