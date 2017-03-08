sudo:
  pkg.installed

wheel_group_sudo:
  file.managed:
    - name: /etc/sudoers.d/00-wheel
    - source: salt://base/sudo/files/etc/sudoers.d/wheel
    - user: root
    - group: root
    - mode: 440
    - check_cmd: /usr/sbin/visudo -c -f
    - require:
      - pkg: sudo
