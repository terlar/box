{%- if salt['pillar.get']('fonts') %}
font_packages:
  pkg.installed:
{% for font in salt['pillar.get']('fonts', []) %}
      - {{ font }}
{%- endfor %}
{%- endif %}
