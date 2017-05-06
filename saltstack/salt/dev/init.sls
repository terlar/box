dev_packages:
  pkg.installed:
    - pkgs:
      - autoconf
      - automake
      - editorconfig-core-c
      - binutils
      - bison
      - diffutils
      - fakeroot
      - file
      - findutils
      - flex
      - gawk
      - gcc
      - gettext
      - grep
      - groff
      - gzip
      - libtool
      - m4
      - make
      - patch
      - sed
      - texinfo
      - time
      - util-linux
      - which
{% for pkg in salt['pillar.get']('dev:packages', []) %}
      - {{ pkg }}
{%- endfor %}
  npm.installed:
    - pkgs:
      - editorconfig-cli
      - jwt-cli
      - wscat

{%- if salt['pillar.get']('languages') %}
include:
{% for language in salt['pillar.get']('dev:languages', []) %}
  - .{{ language }}
{%- endfor %}
{%- endif %}
