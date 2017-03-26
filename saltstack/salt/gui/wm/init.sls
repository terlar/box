{%- if salt['pillar.get']('gui:wms') %}
include:
{% for wm in salt['pillar.get']('gui:wms', []) %}
  - .{{ wm }}
{%- endfor %}
{%- endif %}
