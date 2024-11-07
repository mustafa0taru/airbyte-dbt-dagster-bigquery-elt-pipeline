WITH customer_orders AS (
  SELECT 
    o.customer_id
    COUNT(o.order_id) AS total_orders,
    SUM(p.price * o.quantity) AS total_spend,
    
  FROM {{ ref('stg_orders') }} o
  JOIN {{ ref('stg_products') }} p on o.product_id = p.product_id
  GROUP BY o.customer_id
)

SELECT 
  c.customer_id
  c.name,
  c.email,
  c.address,
  co.total_orders,
  co.total_spend
FROM {{ ref('stg_customers') }} c
LEFT JOIN customer_orders co ON c.customer_id = co.customer_id
