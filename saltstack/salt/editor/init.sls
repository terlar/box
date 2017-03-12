{%- if salt['pillar.get']('editors') %}
include:
{% for editor in salt['pillar.get']('editors', []) %}
  - .{{ editor }}
{%- endfor %}
{%- endif %}
