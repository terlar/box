systemd-swap:
  pkg.installed: []
  service.running:
    - enable: True
    - watch:
      - file: /etc/systemd/swap.conf.d

/etc/systemd/swap.conf.d:
  file.recurse:
    - source: salt://base/swap/files/etc/systemd/swap.conf.d
    - user: root
    - group: root
