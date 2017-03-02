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
    - user: root
    - group: root
    - mode: 664
    - source: salt://docker/files/etc/systemd/system/docker.service.d/override.conf
