bluez:
  pkg.installed

# Local packages include:
# blueproximity
bluetooth_packages:
  pkg.installed:
    - pkgs:
      - bluez-utils
    - require:
      - pkg: bluez

bluetooth_configuration:
  ini.options_present:
    - name: /etc/bluetooth/main.conf
    - sections:
        Policy:
{% if salt['pillar.get']('bluetooth:auto_enable', True) %}
          AutoEnable: "true"
{% else %}
          AutoEnable: "false"
{% endif %}

bluetooth_module:
  kmod.present:
    - name: btusb

bluetooth:
  service.running:
    - enable: True
    - require:
      - pkg: bluez
