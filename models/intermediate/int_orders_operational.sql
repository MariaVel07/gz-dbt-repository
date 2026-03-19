
SELECT date_date, orders_id, revenue_per_order, ship_cost+logcost AS operational_margin, shipping_fee, 
logcost, ship_cost, total_cost_per_order, nb_products
FROM {{ ref('int_orders_margin') }} 
LEFT JOIN {{ ref('stg_gz_raw__ship') }}
USING (orders_id)