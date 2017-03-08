/etc/systemd/network/ipforward.network:
  file.managed:
    - source: salt://base/network/files/etc/systemd/network/ipforward.network
    - user: root
    - group: root
    - mode: 664

systemd-resolved:
  service.running:
    - enable: True
    - reload: True

systemd-networkd:
  service.running:
    - enable: True
    - reload: True

include:
  - .dnsmasq
  - .wired
  - .wireless

/usr/lib/systemd/system/wait-for-dns.service:
  file.managed:
    - source: salt://base/network/files/usr/lib/systemd/system/wait-for-dns.service
    - user: root
    - group: root
    - mode: 664

wait-for-dns:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /usr/lib/systemd/system/wait-for-dns.service

network_tools:
  pkg.installed:
    - pkgs:
      - rsync
      - lftp
      - curl
