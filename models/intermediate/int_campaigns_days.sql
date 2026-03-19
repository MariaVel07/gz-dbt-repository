SELECT date_date, SUM(ads_cost) AS ads_cost_day, SUM(impression) AS sum_impression_day, SUM(click) AS sum_click_day
FROM {{ ref('int_campaigns') }}
GROUP BY date_date 
ORDER BY date_date DESC