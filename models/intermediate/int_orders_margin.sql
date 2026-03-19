SELECT date_date, orders_id, SUM(quantity) AS nb_products, SUM(revenue) AS revenue_per_order, 
    sum(purchase_cost) AS total_cost_per_order, SUM(revenue)-SUM(purchase_cost) AS margin_
FROM {{ ref('int_sales_margin') }}
GROUP BY orders_id, date_date