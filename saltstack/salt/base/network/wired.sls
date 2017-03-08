/etc/systemd/network/wired.network:
  file.managed:
    - source: salt://base/network/files/etc/systemd/network/wired.network
    - user: root
    - group: root
    - mode: 664
