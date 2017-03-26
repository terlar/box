calendar_purge_conflicting_packages:
  pkg.purged:
    - pkgs:
      - khal
      - vdirsyncer

calendar_client:
  pkg.installed:
    - name: khal-git

calendar_synchronization:
  pkg.installed:
    - name: vdirsyncer-git
