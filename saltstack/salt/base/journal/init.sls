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
    - source: salt://base/journal/files/etc/systemd/journald.conf.d/journal-size.conf.jinja
    - user: root
    - group: root
    - mode: 664
    - template: jinja
    - defaults:
        max_size: {{ salt['pillar.get']('journal:max_size', '256M') }}
