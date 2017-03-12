{%- if salt['pillar.get']('terminals') or salt['pillar.get']('terminal:wms') %}
include:
{% for term in salt['pillar.get']('terminals', []) %}
  - .{{ term }}
{%- endfor %}
{%- endif %}
