{%- if salt['pillar.get']('chinese_fonts') %}
chinese_font_packages:
  pkg.installed:
    - pkgs:
{% for font in salt['pillar.get']('chinese_fonts', []) %}
      - {{ font }}
{%- endfor %}
{%- endif %}

{%- if salt['pillar.get']('chinese_input_methods') %}
chinese_input_packages:
  pkg.installed:
    - pkgs:
{% for input in salt['pillar.get']('chinese_input_methods', []) %}
      - {{ input }}
{%- endfor %}
{%- endif %}
