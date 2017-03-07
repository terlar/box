include:
  - base.sudo

# Local packages include:
# cower, downgrader
packaging tools:
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

build sudo file:
  file.managed:
    - name: /etc/sudoers.d/50-build
    - source: salt://base/packaging/files/etc/sudoers.d/build
    - user: root
    - group: root
    - mode: 440
    - check_cmd: /usr/sbin/visudo -c -f
    - require:
      - pkg: sudo

pkgs user:
  user.present:
    - name: pkgs
    - shell: /sbin/nologin
    - home: /home/pkgs
    - uid: 9000
    - gid: build

pkgbuilds repo for pkgs user:
  git.latest:
    - name: https://github.com/terlar/pkgbuilds.git
    - target: /home/pkgs/.pkgbuilds
    - user: pkgs
    - require:
      - pkg: git
      - user: pkgs user

/etc/pacman.d/repos:
  file.managed:
    - source: salt://base/packaging/files/etc/pacman.d/repos.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja

/etc/pacman.conf:
  ini.options_present:
    - sections:
        Include: /etc/pacman.d/repos

{% for repo in pillar.get('repos', []) %}
/home/pkgs/{{ repo }}:
  file.directory:
    - user: pkgs
    - group: build
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group

initialize {{ repo }} pacman repo:
  cmd.run:
    - name: repo-add -q /home/pkgs/{{ repo }}/{{ repo }}.db.tar.gz
    - runas: pkgs
    - creates:
      - /home/pkgs/{{ repo }}/{{ repo }}.db
      - /home/pkgs/{{ repo }}/{{ repo }}.db.tar.gz
      - /home/pkgs/{{ repo }}/{{ repo }}.files
      - /home/pkgs/{{ repo }}/{{ repo }}.files.tar.gz
{% endfor %}

{% set pacman_conf = '/home/pkgs/.pacman.conf' %}
{%- set makepkg_conf = "/usr/share/devtools/makepkg-%s.conf" % grains['cpuarch'] -%}
{%- set chroot_container = "/home/pkgs/.build-chroot/%s" % grains['cpuarch'] -%}

chroot pacman config:
  cmd.run:
    - name: pacconf --raw > {{ pacman_conf }}
    - runas: pkgs
    - onchanges:
      - file: /etc/pacman.d/repos

chroot container:
  file.directory:
    - name: {{ chroot_container }}
    - user: pkgs
    - group: build
    - dir_mode: 775
    - file_mode: 664
    - makedirs: True

create chroot:
  cmd.run:
    - shell: /bin/bash
    - name: |
        [ -d {{ chroot_container }}/root ] && rm -rf {{ chroot_container }}/root
        mkarchroot -C {{ pacman_conf }} -M {{ makepkg_conf }} \
        {{ chroot_container }}/root base-devel
    - require:
      - cmd: chroot pacman config
      - file: chroot container
    - onchanges:
      - file: /etc/pacman.d/repos
      - file: chroot container
