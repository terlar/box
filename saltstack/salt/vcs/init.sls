{%- if salt['pillar.get']('vcs') %}
include:
{% for system in salt['pillar.get']('vcs', []) %}
  - .{{ system }}
{%- endfor %}
{%- endif %}
