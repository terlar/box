packaging_packages:
  pkg.installed:
    - pkgs:
      - devtools
      - findutils
      - pkgfile
      - reflector
      - repose

/etc/sudoers.d/50-build:
  file.managed:
    - user: root
    - group: root
    - mode: 440
    - source: salt://base/packaging/files/etc/sudoers.d/build
    - check_cmd: /usr/sbin/visudo -c -f
    - require:
      - pkg: sudo

create_pkgs_user:
  user.present:
    - name: pkgs
    - shell: /sbin/nologin
    - home: /home/pkgs
    - uid: 9000
    - gid_from_name: True
    - groups:
      - build

checkout_pkgbuilds:
  git.latest:
    - name: https://github.com/terlar/pkgbuilds.git
    - target: /home/pkgs/pkgbuilds
    - user: pkgs
    - require:
      - pkg: git

create_custom_repo_dir:
  file.directory:
    - name: /var/cache/pacman/custom
    - user: pkgs
    - group: pkgs
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group

initialize_custom_repo:
  cmd.run:
    - name: repo-add /var/cache/pacman/custom/custom.db.tar.gz
    - runas: pkgs
    - creates:
      - /var/cache/pacman/custom/custom.db
      - /var/cache/pacman/custom/custom.files

add_custom_repo_config:
  file.managed:
    - name: /etc/pacman.d/custom
    - source: salt://base/packaging/files/etc/pacman.d/custom
    - user: root
    - group: root
    - mode: 644

use_custom_repo_config:
  ini.options_present:
    - name: /etc/pacman.conf
    - sections:
        Include: /etc/pacman.d/custom