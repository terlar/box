{% if salt['pillar.get']('disk_encryption', False) %}
enable_encryption_in_mkinitcpio:
  file.replace:
    - name: /etc/mkinitcpio.conf
    - pattern: '(?<=^HOOKS=")(.*) block (.*)keyboard?\s?(.*)'
    - repl: \1 keyboard block encrypt lvm2 \2\3
    - unless: egrep 'keyboard block encrypt lvm2.*filesystems' /etc/mkinitcpio.conf
{% endif %}
