{%- if pillar.get('browsers') %}
include:
{% for browser in pillar.get('browsers', []) %}
  - .{{ browser }}
{%- endfor %}
{%- endif %}
