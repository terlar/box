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
  npm.installed:
    - pkgs:
      - github-org-repos
      - github-user-repos
