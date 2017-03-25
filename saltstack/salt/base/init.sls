update_all_packages:
  pkg.uptodate:
    - refresh: True

include:
  - .boot
  - vcs/git
  - .timezone
  - .ntp
  - .hostname
  - .swap
  - .network
  - .disk_encryption
  - .udisks
  - .kmscon
  - .shell
  - .sudo
  - .users
  - .repos
  - .grep
  - .diagnostics
  - .archival
  - .packaging
  - .journal
