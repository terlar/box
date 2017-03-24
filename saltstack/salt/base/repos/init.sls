pacman_repo_config:
  file.managed:
    - name: /etc/pacman.d/repos
    - source: salt://base/repos/files/etc/pacman.d/repos.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        repos: {{ salt['pillar.get']('repos', []) }}
  ini.options_present:
    - name: /etc/pacman.conf
    - sections:
        Include: /etc/pacman.d/repos
