SELECT 
  customer_id,
  product_id,
  order_date,
  added_to_cart_at,
  TIMESTAMP_DIFF(order_date, added_to_cart_at, SECOND) AS time_to_order_seconds,
  returned_at
FROM {{ ref('stg_orders') }}
