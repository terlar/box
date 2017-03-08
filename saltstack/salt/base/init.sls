update_all_packages:
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
  - .archival
  - .journal
