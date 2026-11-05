with orders as (
    select * from {{ ref('slv_sql_server_dbo__orders') }}
),

fct_orders as (
    select
        -- Claves foráneas (Foreign Keys) a las dimensiones
        order_id,
        user_id,
        address_id,
        promo_id,
        
        -- Fechas y datos transaccionales
        created_at_utc,
        estimated_delivery_at_utc,
        delivered_at_utc,
        tracking_id,
        shipping_service,
        order_status,
        
        -- Métricas de negocio (Hechos)
        shipping_cost_usd,
        order_cost_usd,
        order_total_usd
        
    from orders
)

select * from fct_orders