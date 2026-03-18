WITH join_margins AS 
(
SELECT operational.date_date, orders_id, revenue_per_order, operational_margin, shipping_fee, 
operational.logcost, operational.ship_cost, total_cost_per_order, nb_products
FROM {{ ref('int_sales_margin') }} AS sales
LEFT JOIN {{ ref('int_orders_operational') }} AS operational
USING (orders_id)
)
SELECT join_margins.date_date, COUNT(orders_id) AS nb_transactions, SUM(revenue_per_order) AS total_revenue, AVG(revenue_per_order) AS average_basket,
 sum(operational_margin) AS daily_operational_margin, SUM(total_cost_per_order) AS total_purchase_cost, SUM(shipping_fee) AS total_shipping_fees,
 SUM(logcost) AS total_logcost, SUM(nb_products) AS nb_products_sold
 FROM join_margins
 GROUP BY date_date 