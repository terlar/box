{%- if salt['pillar.get']('cm') %}
include:
{% for tool in salt['pillar.get']('cm', []) %}
  - .{{ tool }}
{%- endfor %}
{%- endif %}
