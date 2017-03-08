{%- if pillar.get('fonts') %}
font_packages:
  pkg.installed:
    - pkgs:
{% for font in pillar.get('fonts', []) %}
      - {{ font }}
{%- endfor %}
{%- endif %}
