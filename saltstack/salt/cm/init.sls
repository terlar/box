{%- if pillar.get('cm') %}
include:
{% for tool in pillar.get('cm', []) %}
  - .{{ tool }}
{%- endfor %}
{%- endif %}
