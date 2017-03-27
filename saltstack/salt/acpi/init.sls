xorg-xbacklight:
  pkg.purged

acpi_tools:
  pkg.installed:
    - pkgs:
      - acpi
      - acpilight

acpid:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: acpid

/etc/acpi/events:
  file.recurse:
    - source: salt://acpi/files/etc/acpi/events
    - user: root
    - group: root
    - file_mode: 644

/etc/acpi/handlers:
  file.recurse:
    - source: salt://acpi/files/etc/acpi/handlers
    - user: root
    - group: root
    - file_mode: 755

/etc/udev/rules.d/90-backlight.rules:
  file.managed:
    - source: salt://acpi/files/etc/udev/rules.d/backlight.rules
    - user: root
    - group: root
    - mode: 664
