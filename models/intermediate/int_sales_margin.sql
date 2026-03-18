WITH join_price AS
(
SELECT *
FROM {{ ref('stg_gz_raw__sales') }}
LEFT JOIN {{ ref('stg_gz_raw__product') }}
USING (products_id)
),
purchase_cost_calc AS
(

SELECT date_date, orders_id, quantity, purchase_price, revenue,
    purchase_price*quantity AS purchase_cost
FROM join_price
)
SELECT date_date, orders_id, SUM(quantity) AS nb_products, SUM(revenue) AS revenue_per_order, 
    sum(purchase_cost) AS total_cost_per_order, SUM(revenue)-SUM(purchase_cost) AS margin_
FROM purchase_cost_calc
GROUP BY orders_id, date_date
