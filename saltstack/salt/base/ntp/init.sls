/etc/systemd/timesyncd.conf:
  file.managed:
    - source: salt://base/ntp/files/etc/systemd/timesyncd.conf
    - user: root
    - group: root
    - mode: 664

enable_systemd-timesyncd:
  cmd.run:
    - name: timedatectl set-ntp true
    - unless: 'timedatectl status | grep -q "Network time on: yes"'
