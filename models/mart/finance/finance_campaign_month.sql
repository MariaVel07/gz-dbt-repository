SELECT EXTRACT(MONTH FROM date_date) AS month_finance, SUM(daily_operational_margin-ads_cost_day) AS ads_margin, 
    AVG(average_basket) AS average_basket, SUM(daily_operational_margin) AS month_operational_margin,
    SUM(ads_cost_day) AS ads_cost_month, SUM(sum_impression_day) AS impression_month, 
    SUM(sum_click_day) AS click_month, SUM(nb_products_sold) AS products_month, SUM(total_revenue) AS revenue,
    SUM(total_purchase_cost) AS purchase_cost, SUM(total_margin) AS monthly_margin, SUM(total_shipping_fees) AS monthly_shipping_fees,
    SUM(total_logcost) AS month_logcost, SUM(total_ship_cost) AS month_ship_cost 
FROM {{ ref('finance_campaigns_day') }}
GROUP BY EXTRACT(MONTH FROM date_date)
ORDER BY EXTRACT(MONTH FROM date_date) DESC