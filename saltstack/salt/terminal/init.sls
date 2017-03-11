{%- if pillar.get('terminals') %}
include:
{% for term in pillar.get('terminals', []) %}
  - .{{ term }}
{%- endfor %}
{%- endif %}
