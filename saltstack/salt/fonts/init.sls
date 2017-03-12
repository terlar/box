font_packages:
  pkg.installed:
    - pkgs:
      - fontconfig
      - freetype2
{% for font in salt['pillar.get']('fonts', []) %}
      - {{ font }}
{%- endfor %}
