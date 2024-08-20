select
    id,
    name,
    email,
    address,
    _airbyte_raw_id,
    _airbyte_meta,
    _airbyte_extracted_at,
from {{ source('postgres', 'customers') }}
