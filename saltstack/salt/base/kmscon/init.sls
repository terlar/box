kmscon:
  pkg.installed

# Enable kmscon on tty1
getty@tty1:
  service.disabled
kmsconvt@tty1:
  service.running:
    - enable: True

# Enable kmscon on all virtual terminals
/etc/systemd/system/autovt@.service:
  file.symlink:
    - target: /usr/lib/systemd/system/kmsconvt@.service
    - force: True

/etc/kmscon/kmscon.conf:
  file.managed:
    - source: salt://base/kmscon/files/etc/kmscon/kmscon.conf
    - user: root
    - group: root
    - mode: 664
