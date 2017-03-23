calendar_client:
  pkg.installed:
    - pkgs:
      - khal

calendar_synchronization:
  pkg.installed:
    - name: vdirsyncer-git
