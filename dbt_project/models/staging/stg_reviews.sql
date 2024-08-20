select
    id,
    rating,
    description,
    product_id,
    customer_id,
    _airbyte_raw_id,
    _airbyte_meta,
    _airbyte_extracted_at,
from {{ source('postgres', 'reviews') }}