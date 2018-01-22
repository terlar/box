diagnostics_packages:
  pkg.installed:
    - pkgs:
      - cpupower
      - dfc
      - dmidecode
      - glances
      - htop
      - httping
      - iftop
      - iotop
      - lshw
      - lsof
      - mtr
      - ncdu
      - perf
      - powertop
      - sysdig
      - usbutils

{% for name, user in salt['pillar.get']('users', {}).items() %}
diagnostics_npm_packages_for_user_{{ name }}:
  npm.installed:
    - user: {{ name }}
    - env:
        NPM_CONFIG_PREFIX: ~/.npm-global
    - pkgs:
      - gtop
{% endfor %}

{% if salt['pillar.get']('gui:enabled', False) %}
diagnostics_gui_packages:
  pkg.installed:
    - pkgs:
      - baobab
      - filelight
{% endif %}
