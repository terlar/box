{%- if pillar.get('editors') %}
include:
{% for editor in pillar.get('editors', []) %}
  - .{{ editor }}
{%- endfor %}
{%- endif %}
