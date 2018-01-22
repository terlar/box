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
      - remake
      - sed
      - texinfo
      - time
      - util-linux
      - which
{% for pkg in salt['pillar.get']('dev:packages', []) %}
      - {{ pkg }}
{%- endfor %}

{% for name, user in salt['pillar.get']('users', {}).items() %}
dev_npm_packages_for_user_{{ name }}:
  npm.installed:
    - user: {{ name }}
    - env:
        NPM_CONFIG_PREFIX: ~/.npm-global
    - pkgs:
      - editorconfig-cli
      - jwt-cli
      - mad
      - wscat
{% endfor %}

include:
{%- if salt['pillar.get']('dev:tools') %}
{% for tool in salt['pillar.get']('dev:tools', []) %}
  - .{{ tool }}
{%- endfor %}
{%- endif %}

{%- if salt['pillar.get']('dev:languages') %}
{% for language in salt['pillar.get']('dev:languages', []) %}
  - .{{ language }}
{%- endfor %}
{%- endif %}
