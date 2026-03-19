SELECT * 
FROM {{ ref('stg_gz_raw__adwords') }}
UNION ALL
SELECT *
FROM {{ ref('stg_gz_raw__bing') }}
UNION ALL
SELECT *
FROM {{ ref('stg_gz_raw__criteo') }}
UNION ALL 
SELECT *
FROM {{ ref('stg_gz_raw__facebook') }}