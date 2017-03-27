powertop:
  pkg.installed

/etc/systemd/system/powertop.service:
  file.managed:
    - source: salt://powertop/files/etc/systemd/system/powertop.service
    - user: root
    - group: root
    - mode: 664
    - makedirs: True

powertop_service:
  service.running:
    - name: powertop
    - watch:
      - file: /etc/systemd/system/powertop.service
