nvme-cli:
  pkg.installed: []

fstrim.timer:
  service.running:
    - enable: True
    - reload: True
