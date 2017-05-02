include:
  - .x11
  - .themes
  - .wm

gui_packages:
  pkg.installed:
    - pkgs:
{% for pkg in salt['pillar.get']('gui:packages', []) %}
      - {{ pkg }}
{%- endfor %}
  npm.installed:
    - pkgs:
      - electron
      - electron-open-url

/usr/share/backgrounds:
  file.recurse:
    - source: salt://gui/files/usr/share/backgrounds
    - user: root
    - group: root
