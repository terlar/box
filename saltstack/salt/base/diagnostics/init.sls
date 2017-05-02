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

{% if salt['pillar.get']('gui:enabled', False) %}
diagnostics_gui_packages:
  pkg.installed:
    - pkgs:
      - baobab
      - filelight
{% endif %}
