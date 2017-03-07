include:
{% for editor in pillar.get('editors', []) %}
  - .{{ editor }}
{%- endfor %}
