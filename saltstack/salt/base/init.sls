refresh_packages:
  pkg.uptodate:
    - refresh: True

include:
  - .swap
  - .network
  - .shell
  - .sudo
  - .git
  - .users
  - .packaging
  - .journal
