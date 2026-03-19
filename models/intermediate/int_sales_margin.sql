WITH join_price AS
(
SELECT *
FROM {{ ref('stg_gz_raw__sales') }}
LEFT JOIN {{ ref('stg_gz_raw__product') }}
USING (products_id)
)

SELECT date_date, orders_id, quantity, purchase_price, revenue,
    purchase_price*quantity AS purchase_cost
FROM join_price

