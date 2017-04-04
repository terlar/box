include:
  - base.sudo

packaging_tools:
  pkg.installed:
    - pkgs:
      - cower
      - devtools
      - downgrader
      - findutils
      - guzuta-git
      - pacutils
      - pkgbuild-introspection
      - pkgfile
      - reflector
      - repose

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

{% set makepkg_conf = "/usr/share/devtools/makepkg-%s.conf" % grains['cpuarch'] %}
{% set pacman_conf = '/var/cache/pkgs/pacman.conf' %}
{% set chroot_container = "/var/cache/pkgs/chroot-%s" % grains['cpuarch'] %}

chroot_pacman_config:
  cmd.run:
    - name: pacconf --raw > {{ pacman_conf }}
    - makedirs: True
    - creates:
      - {{ pacman_conf }}

chroot_container:
  file.directory:
    - name: {{ chroot_container }}
    - dir_mode: 775
    - file_mode: 664
    - makedirs: True

chroot:
  cmd.run:
    - name: |
        mkarchroot -C {{ pacman_conf }} -M {{ makepkg_conf }} {{ chroot_container }}/root base base-devel
    - creates:
      - {{ chroot_container }}/root
    - require:
      - cmd: chroot_pacman_config
      - file: chroot_container
