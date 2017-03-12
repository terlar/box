{%- if salt['pillar.get']('fonts') %}
font_packages:
  pkg.installed:
    - pkgs:
{% for font in salt['pillar.get']('fonts', []) %}
      - {{ font }}
{%- endfor %}
{%- endif %}
