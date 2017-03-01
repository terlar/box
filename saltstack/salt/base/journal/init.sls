/etc/systemd/journald.conf.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group

/etc/systemd/journald.conf.d/00-journal-size.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 664
    - source: salt://base/journal/files/etc/systemd/journald.conf.d/00-journal-size.conf
