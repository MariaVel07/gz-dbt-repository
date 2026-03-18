WITH join_margin AS
(
SELECT orders_id, date_date, shipping_fee, logcost, ship_cost, margin_
FROM {{ ref('stg_gz_raw__ship') }}
LEFT join {{ ref('int_sales_margin') }}
USING (orders_id)
)
SELECT orders_id, date_date, margin_+shipping_fee-logcost-ship_cost AS operational_margin
FROM join_margin