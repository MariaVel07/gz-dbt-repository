{{ dbt_utils.union_relations(
    relations=[ref('stg_gz_raw__adwords'), ref('stg_gz_raw__bing') ,ref('stg_gz_raw__criteo'), ref('stg_gz_raw__facebook')],
) }}