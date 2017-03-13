include:
  - base.sudo

# Local packages include:
# cower, downgrader
packaging_tools:
  pkg.installed:
    - pkgs:
      - cower
      - devtools
      - downgrader
      - findutils
      - pacutils
      - pkgbuild-introspection
      - pkgfile
      - reflector
      - repose

/usr/bin/pkgs:
  file.managed:
    - source: salt://base/packaging/files/usr/bin/pkgs
    - user: root
    - group: root
    - mode: 755

build_group_sudo:
  file.managed:
    - name: /etc/sudoers.d/50-build
    - source: salt://base/packaging/files/etc/sudoers.d/build
    - user: root
    - group: root
    - mode: 440
    - check_cmd: /usr/sbin/visudo -c -f
    - require:
      - pkg: sudo

pkgs_user:
  user.present:
    - name: pkgs
    - shell: /sbin/nologin
    - home: /home/pkgs
    - uid: 9000
    - gid: build

pkgbuilds:
  git.latest:
    - name: https://github.com/terlar/pkgbuilds.git
    - target: /home/pkgs/.pkgbuilds
    - user: pkgs
    - require:
      - pkg: git
      - user: pkgs_user

pacman_repo_config:
  file.managed:
    - name: /etc/pacman.d/repos
    - source: salt://base/packaging/files/etc/pacman.d/repos.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
  ini.options_present:
    - name: /etc/pacman.conf
    - sections:
        Include: /etc/pacman.d/repos

{% for repo in salt['pillar.get']('repos', []) %}
/home/pkgs/{{ repo }}:
  file.directory:
    - user: pkgs
    - group: build
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group

{{ repo }}_pacman_repo:
  cmd.run:
    - name: repose -r /home/pkgs/{{ repo }} -zfv {{ repo }}
    - runas: pkgs
    - creates:
      - /home/pkgs/{{ repo }}/{{ repo }}.db
      - /home/pkgs/{{ repo }}/{{ repo }}.files
{% endfor %}

{% set pacman_conf = '/home/pkgs/.pacman.conf' %}
{% set makepkg_conf = "/usr/share/devtools/makepkg-%s.conf" % grains['cpuarch'] %}
{% set chroot_container = "/home/pkgs/.build-chroot/%s" % grains['cpuarch'] %}

chroot_pacman_config:
  cmd.run:
    - name: pacconf --raw > {{ pacman_conf }}
    - runas: pkgs
    - onchanges:
      - file: pacman_repo_config

chroot_container:
  file.directory:
    - name: {{ chroot_container }}
    - user: pkgs
    - group: build
    - dir_mode: 775
    - file_mode: 664
    - makedirs: True

chroot:
  cmd.run:
    - shell: /bin/bash
    - name: |
        [ -d {{ chroot_container }}/root ] && rm -rf {{ chroot_container }}/root
        mkarchroot -C {{ pacman_conf }} -M {{ makepkg_conf }} \
        {{ chroot_container }}/root base-devel
    - require:
      - cmd: chroot_pacman_config
      - file: chroot_container
    - onchanges:
      - file: pacman_repo_config
      - file: chroot_container
