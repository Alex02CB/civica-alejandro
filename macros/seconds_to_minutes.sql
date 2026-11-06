{% macro seconds_to_minutes(column_name, precision=2) -%}
    round({{ column_name }} / 60, {{ precision }})
{%- endmacro %}

{{ seconds_to_minutes('session_seconds') }} as session_minutes