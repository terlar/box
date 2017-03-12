update_all_packages:
  pkg.uptodate:
    - refresh: True

include:
  - vcs/git
  - .timezone
  - .hostname
  - .swap
  - .network
  - .udisks
  - .shell
  - .sudo
  - .users
  - .packaging
  - .archival
  - .journal
