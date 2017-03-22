update_all_packages:
  pkg.uptodate:
    - refresh: True

include:
  - vcs/git
  - .timezone
  - .ntp
  - .hostname
  - .swap
  - .network
  - .udisks
  - .kmscon
  - .shell
  - .sudo
  - .users
  - .packaging
  - .grep
  - .diagnostics
  - .archival
  - .journal
