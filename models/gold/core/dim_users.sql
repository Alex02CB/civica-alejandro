with users as (
    select * from {{ ref('slv_sql_server_dbo__users') }}
),

addresses as (
    select * from {{ ref('slv_sql_server_dbo__addresses') }}
),

dim_users as (
    select
        -- Datos descriptivos del usuario
        u.user_id,
        u.first_name,
        u.last_name,
        u.email,
        u.phone_number,
        u.created_at_utc,
        u.updated_at_utc,
        
        -- Datos descriptivos de la dirección
        a.address_id,
        a.country,
        a.state,
        a.zipcode,
        a.address_line

    from users u
    left join addresses a 
        on u.address_id = a.address_id
)

select * from dim_users