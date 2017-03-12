git:
  pkg.installed

git_tools:
  pkg.installed:
    - pkgs:
      - hub
      - ghq
      - tig
    - require:
      - pkg: git
