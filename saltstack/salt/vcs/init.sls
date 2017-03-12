{%- if pillar.get('vcs') %}
include:
{% for system in pillar.get('vcs', []) %}
  - .{{ system }}
{%- endfor %}
{%- endif %}
