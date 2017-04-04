{% for key in salt['pillar.get']('repo_keys', []) %}
pacman_add_key_{{ key }}:
  cmd.run:
    - name: pacman-key --recv-keys {{ key }}
    - unless: pacman-key --list-keys {{ key }}

pacman_sign_key_{{ key }}:
  cmd.run:
    - name: pacman-key --lsign {{ key }}
    - unless: pacman-key --list-keys {{ key }} | egrep '\[\s+full\s+\]'
{% endfor %}

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
