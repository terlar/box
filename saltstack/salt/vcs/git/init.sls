git:
  pkg.installed

git_tools:
  pkg.installed:
    - pkgs:
      - bfg
      - hub
      - ghq
      - git-lfs
      - tig
    - require:
      - pkg: git

{% for name, user in salt['pillar.get']('users', {}).items() %}
git_tools_npm_packages_for_user_{{ name }}:
  npm.installed:
    - user: {{ name }}
    - env:
        NPM_CONFIG_PREFIX: ~/.npm-global
    - pkgs:
      - github-org-repos
      - github-user-repos
{% endfor %}
