{% macro margin_percent (margin, revenue, decimals=2) %}
    ROUND(safe_divide({{margin}},{{revenue}}),{{decimals}})
{%endmacro%}