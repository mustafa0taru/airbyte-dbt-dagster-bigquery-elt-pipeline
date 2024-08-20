WITH sales_data AS (
  SELECT 
    product_id,
    SUM(o.quantity) AS total_units_sold,
    SUM(o.quantity * p.price) AS total_sales
  FROM {{ ref('stg_products') }} p
  JOIN {{ ref('stg_orders') }} o ON p.product_id = o.product_id
  GROUP BY p.product_id
),

rewiews_data AS (
SELECT 
  product_id,
  AVG(rating) AS average_rating,
  p.model,
  b.order_count
FROM {{ ref('stg_reviews') }}
GROUP BY product_id
)

SELECT
  s.product_id
  s.total_units_sold
  s.total_sales
  r.average_rating
FROM sales_data s
LEFT JOIN rewiews_data r ON s.product_id = r.product_id