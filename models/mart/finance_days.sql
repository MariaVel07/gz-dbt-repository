{{config(materialized='table')}}
SELECT date_date, COUNT(orders_id) AS nb_transactions, SUM(revenue_per_order) AS total_revenue, AVG(revenue_per_order) AS average_basket,
 sum(operational_margin) AS daily_operational_margin, SUM(total_cost_per_order) AS total_purchase_cost, SUM(shipping_fee) AS total_shipping_fees,
 SUM(logcost) AS total_logcost, SUM(nb_products) AS nb_products_sold
 FROM {{ ref('int_orders_operational') }}
 GROUP BY date_date 