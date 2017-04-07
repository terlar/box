fstrim.timer:
  service.running:
    - enable: True
    - reload: True

ssd_lvm_issue_discards:
  file.replace:
    - name: /etc/lvm/lvm.conf
    - pattern: issue_discards = 0
    - repl: issue_discards = 1
