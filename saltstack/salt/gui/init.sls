include:
  - .wm

gui_packages:
  pkg.installed:
    - pkgs:
{% for pkg in salt['pillar.get']('gui:packages', []) %}
      - {{ pkg }}
{%- endfor %}
