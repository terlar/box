refresh_packages:
  pkg.uptodate:
    - refresh: True

include:
  - .network
  - .shell
  - .sudo
  - .git
  - .users
  - .packaging
  - .journal
