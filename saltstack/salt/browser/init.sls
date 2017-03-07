include:
{% for browser in pillar.get('browsers', []) %}
  - .{{ browser }}
{%- endfor %}
