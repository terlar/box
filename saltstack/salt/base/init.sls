update_all_packages:
  pkg.uptodate:
    - refresh: True

include:
  - .boot
  - .timezone
  - .ntp
{% if salt['pillar.get']('hostname') %}
  - .hostname
{% endif %}
  - .swap
  - .network
  - .disk_encryption
  - .udisks
  - .kmscon
  - vcs/git
  - .shell
  - .sudo
  - .users
  - .repos
  - .grep
  - .diagnostics
  - .archival
  - .packaging
  - .journal
