{% set columnas_excluidas = ['event_id'] %}

select
    {{ dbt_utils.star(
        from=ref('slv_sql_server_dbo__events'),
        except=columnas_excluidas
    ) }}
from {{ ref('slv_sql_server_dbo__events') }}