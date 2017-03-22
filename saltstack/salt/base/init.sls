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
  - .disk_encryption
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
