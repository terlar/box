include:
  - acpi
  - hardware/touchpad/generic

/etc/modprobe.d/modprobe.conf:
  file.managed:
    - source: salt://dell-xps/files/etc/modprobe.d/modprobe.conf
    - user: root
    - group: root
    - mode: 664

mkinitcpio_modules:
  # This would be much nicer as an ini.options_present, but currently it
  # is broken and don't allow us to edit files without adding spaces
  # between the equal signs.
  # See: https://github.com/saltstack/salt/issues/33669
  file.replace:
    - name: /etc/mkinitcpio.conf
    - pattern: '(?<=^MODULES=)(".*")'
    - repl: '"intel_agp i915"'
    - unless: grep 'intel_agp i915' /etc/mkinitcpio.conf

mkinitcpio_modprobe_file:
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

update_mkinitcpio:
  cmd.run:
    - name: mkinitcpio -p linux
    - onchanges:
      - file: mkinitcpio_modules
      - file: mkinitcpio_modprobe_file
      - file: /etc/modprobe.d/modprobe.conf
