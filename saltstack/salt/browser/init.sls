{%- if salt['pillar.get']('browsers') %}
include:
{% for browser in salt['pillar.get']('browsers', []) %}
  - .{{ browser }}
{%- endfor %}
{%- endif %}
