javascript_dev_packages:
  pkg.installed:
    - pkgs:
      - nodejs
      - npm
  npm.installed:
    - pkgs:
      - yarn

{% for name, user in salt['pillar.get']('users', {}).items() %}
{%- set current = salt.user.info(name) -%}
{%- set home = current.get('home', "/home/%s" % name) -%}
{%- set gid = current.get('gid') -%}
create_npm_global_dir_for_user_{{ name }}:
   file.directory:
    - name: {{ home }}/.npm-global
    - user: {{ name }}
    - group: {{ gid }}

javascript_dev_npm_packages_for_user_{{ name }}:
  npm.installed:
    - user: {{ name }}
    - env:
        NPM_CONFIG_PREFIX: ~/.npm-global
    - pkgs:
      - javascript-typescript-langserver
      - wscat
      - wt-cli
      - yarn
{% endfor %}

javascript_build_tools:
  npm.installed:
    - pkgs:
      - bower
      - gulp

javascript_code_tools:
  npm.installed:
    - pkgs:
      - eslint
      - eslint-plugin-import
      - eslint-config-airbnb-base
      - tern
      - trepanjs
