dnsmasq_package:
  pkg.installed:
    - name: dnsmasq

/etc/resolv.conf:
  file.managed:
    - source: salt://base/network/files/etc/resolv.conf
    - user: root
    - group: root
    - mode: 664

/etc/resolv-dnsmasq.conf:
  file.symlink:
    - target: /run/systemd/resolve/resolv.conf

/etc/dnsmasq.conf:
  file.managed:
    - source: salt://base/network/files/etc/dnsmasq.conf
    - user: root
    - group: root
    - mode: 664

/etc/systemd/system/dnsmasq.service.d/after-systemd-resolved.conf:
  file.managed:
    - source: salt://base/network/files/etc/systemd/system/dnsmasq.service.d/after-systemd-resolved.conf
    - makedirs: True
    - user: root
    - group: root
    - mode: 664

dnsmasq_service:
  service.running:
    - name: dnsmasq
    - enable: True
