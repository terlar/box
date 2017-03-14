sudo:
  pkg.installed

wheel_group_sudo:
  file.managed:
    - name: /etc/sudoers.d/00-wheel
    - source: salt://base/sudo/files/etc/sudoers.d/wheel.jinja
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - check_cmd: /usr/sbin/visudo -c -f
    - defaults:
        passwordless_commands: {{ salt['pillar.get']('passwordless_sudo', []) }}
    - require:
      - pkg: sudo
