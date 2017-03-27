udisks2:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: udisks2

udiskie:
  pkg.installed
