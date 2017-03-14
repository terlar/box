nss-mdns:
  pkg.installed

/etc/nsswitch.conf:
  file.replace:
    - pattern: '(?<=^hosts: )(.*) (resolve \[!UNAVAIL=return\] dns)'
    - repl: \1 mdns_minimal [NOTFOUND=return] \2
    - unless: cat /etc/nsswitch.conf | grep 'mdns_minimal \[NOTFOUND=return\]'

avahi:
  pkg.installed: []
  service.running:
    - name: avahi-daemon
    - enable: True
