include:
  - base.sudo

packaging_tools:
  pkg.installed:
    - pkgs:
      - devtools
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


/home/pkgs:
  file.directory:
    - user: pkgs
    - group: build
    - mode: 770

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
      - user: pkgs_user

{% set pacman_conf = '/home/pkgs/.pacman.conf' %}
{% set makepkg_conf = "/usr/share/devtools/makepkg-%s.conf" % grains['cpuarch'] %}
{% set chroot_container = "/home/pkgs/.build-chroot/%s" % grains['cpuarch'] %}

chroot_pacman_config:
  cmd.run:
    - name: pacconf --raw > {{ pacman_conf }}
    - runas: pkgs
    - creates:
      - {{ pacman_conf }}

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
      - cmd: chroot_pacman_config
      - file: pacman_repo_config
      - file: chroot_container

packaging_local_packages:
  pkg.installed:
    - pkgs:
      - cower
      - downgrader
