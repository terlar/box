{%- if salt['pillar.get']('terminals') or salt['pillar.get']('terminal:wms') %}
include:
{% for term in salt['pillar.get']('terminals', []) %}
  - .{{ term }}
{%- endfor %}
{% for wm in salt['pillar.get']('terminal:wms', []) %}
  - .wm.{{ wm }}
{%- endfor %}
{%- endif %}
