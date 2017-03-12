udisks2:
  pkg.installed: []
  service.running:
    - enable: True
    - watch:
      - pkg: udisks2
    - require:
      - pkg: udisks2

udiskie:
  pkg.installed
