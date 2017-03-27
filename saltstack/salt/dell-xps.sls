include:
  - hardware/touchpad/generic

/etc/modprobe.d/modprobe.conf:
  file.managed:
    - source: salt://dell-xps/files/etc/modprobe.d/modprobe.conf
    - user: root
    - group: root
    - mode: 664

add_modprobe_file_to_mkinitcpio:
  # This would be much nicer as an ini.options_present, but currently it
  # is broken and don't allow us to edit files without adding spaces
  # between the equal signs.
  # See: https://github.com/saltstack/salt/issues/33669
  file.replace:
    - name: /etc/mkinitcpio.conf
    - pattern: '(?<=^FILES=)(".*")'
    - repl: '"/etc/modprobe.d/modprobe.conf"'
    - unless: grep '/etc/modprobe.d/modprobe.conf' /etc/mkinitcpio.conf
    - require:
      - file: /etc/modprobe.d/modprobe.conf
  cmd.run:
    - name: mkinitcpio -p linux
    - onchanges:
      - file: add_modprobe_file_to_mkinitcpio
