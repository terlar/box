include:
{% for term in pillar.get('terminals', []) %}
  - .{{ term }}
{%- endfor %}
