{% for name, user in salt['pillar.get']('users', {}).items() %}
elm_dev_npm_packages_for_user_{{ name }}:
  npm.installed:
    - user: {{ name }}
    - env:
        NPM_CONFIG_PREFIX: ~/.npm-global
    - pkgs:
      - elm
      - elm-format
      - elm-oracle
{% endfor %}
