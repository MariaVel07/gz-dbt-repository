SELECT date_date, daily_operational_margin-ads_cost_day AS ads_margin, average_basket, daily_operational_margin, ads_cost_day, sum_impression_day, sum_click_day,
    nb_products_sold, total_revenue, total_purchase_cost, total_margin, total_shipping_fees, total_logcost, total_ship_cost, 
FROM {{ ref('finance_days') }}
LEFT JOIN {{ ref('int_campaigns_days') }}
USING (date_date)