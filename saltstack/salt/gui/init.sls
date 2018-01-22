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

{% for name, user in salt['pillar.get']('users', {}).items() %}
gui_npm_packages_for_user_{{ name }}:
  npm.installed:
    - user: {{ name }}
    - env:
        NPM_CONFIG_PREFIX: ~/.npm-global
    - pkgs:
      - electron
      - electron-open-url
{% endfor %}

/usr/share/backgrounds:
  file.recurse:
    - source: salt://gui/files/usr/share/backgrounds
    - user: root
    - group: root
