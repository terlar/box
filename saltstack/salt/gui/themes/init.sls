default_theme_packages:
  pkg.installed:
    - pkgs:
      - gnome-themes-standard

{%- if salt['pillar.get']('gui:themes') %}
include:
{% for theme in salt['pillar.get']('gui:themes', []) %}
  - .{{ theme }}
{%- endfor %}
{%- endif %}
