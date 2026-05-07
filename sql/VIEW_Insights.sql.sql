-- Overall Dashboard view with numbers rounded to 2 decimal places 

CREATE VIEW final_dashboard_view AS
SELECT 
    h.country,

    ROUND(AVG(h.nominal_house_price_index), 2) AS avg_price,
    ROUND(AVG(h.price_to_income_ratio), 2) AS affordability,
    ROUND(AVG(h.interest_rate), 2) AS interest_rate,

    ROUND(MAX(i.final_score), 2) AS final_score,
    MAX(i.final_recommendation) AS final_recommendation

FROM housing_data h
JOIN investment_scores i
    ON h.country = i.country

GROUP BY h.country;

SELECT * 
FROM final_dashboard_view
LIMIT 10;

SELECT country
FROM final_dashboard_view
WHERE final_recommendation LIKE '%Buy%';

-- Ranking table
SELECT 
    country,
    final_score,
    RANK() OVER (ORDER BY final_score DESC) AS ranking
FROM final_dashboard_view;