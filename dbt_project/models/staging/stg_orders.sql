select
    id,
    quantity,
    order_date,
    customer_id,
    product_id,
    _airbyte_raw_id,
    _airbyte_meta,
    _airbyte_extracted_at,
from {{ source('postgres', 'orders') }}
