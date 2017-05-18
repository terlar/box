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
