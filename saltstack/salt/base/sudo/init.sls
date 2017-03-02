sudo:
  pkg.installed

/etc/sudoers.d/00-wheel:
  file.managed:
    - user: root
    - group: root
    - mode: 440
    - source: salt://base/sudo/files/etc/sudoers.d/wheel
    - check_cmd: /usr/sbin/visudo -c -f
    - require:
      - pkg: sudo
