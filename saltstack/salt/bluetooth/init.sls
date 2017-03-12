bluez:
  pkg.installed

# Local packages include:
# blueproximity
bluetooth_packages:
  pkg.installed:
    - pkgs:
      - blueproximity
      - bluez-utils
    - require:
      - pkg: bluez

bluetooth_module:
  kmod.present:
    - name: btusb

bluetooth:
  service.running:
    - enable: True
    - watch:
      - pkg: bluez
    - require:
      - pkg: bluez
