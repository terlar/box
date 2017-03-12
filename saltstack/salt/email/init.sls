email_client:
  pkg.installed:
    - pkgs:
      - msmtp
      - mutt
      - urlview

email_indexing:
  pkg.installed:
    - pkgs:
      - notmuch
      - notmuch-mutt

email_synchronization:
  pkg.installed:
    - name: offlineimap
