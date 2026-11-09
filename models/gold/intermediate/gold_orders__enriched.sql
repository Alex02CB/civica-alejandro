-- =============================================================================
-- gold_orders__enriched
-- =============================================================================
-- Capa Gold (Intermediate): Unifica la información de los pedidos con
-- los datos de las direcciones (addresses) y las promociones (promos).
-- =============================================================================

with orders as (
    select * from {{ ref('slv_sql_server_dbo__orders') }}
),

addresses as (
    select * from {{ ref('slv_sql_server_dbo__addresses') }}
),

promos as (
    select * from {{ ref('slv_sql_server_dbo__promos') }}
),

enriched_orders as (
    select
        -- Columnas base de Orders
          o.order_id
        , o.user_id
        , o.address_id
        , o.promo_id
        , o.created_at_utc
        , o.estimated_delivery_at_utc
        , o.delivered_at_utc
        , o.tracking_id
        , o.shipping_service
        , o.shipping_cost_usd
        , o.item_order_cost_usd
        , o.total_order_cost_usd
        , o.order_status
        , o.date_load
        
        -- Columnas de Addresses
        -- (a.address_id y a.date_load eliminados por duplicidad)
        , a.address_line
        , a.zipcode
        , a.state
        , a.country
        
        -- Columnas de Promos
        -- (p.promo_id y p.date_load eliminados por duplicidad)
        , p.discount_usd
        , p.promo_status

    from orders o
    left join addresses a 
        on o.address_id = a.address_id
    left join promos p 
        on o.promo_id = p.promo_id
)

select * from enriched_orders