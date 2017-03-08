docker:
  pkg.installed: []
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: docker
      - file: /etc/systemd/system/docker.service.d/override.conf

docker-compose:
  pkg.installed

/etc/systemd/system/docker.service.d/override.conf:
  file.managed:
    - source: salt://docker/files/etc/systemd/system/docker.service.d/override.conf
    - user: root
    - group: root
    - mode: 664

/etc/systemd/system/docker.service.d/dns.conf:
  file.managed:
    - source: salt://docker/files/etc/systemd/system/docker.service.d/dns.conf
    - user: root
    - group: root
    - mode: 664
