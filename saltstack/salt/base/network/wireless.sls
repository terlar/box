/etc/systemd/network/wireless.network:
  file.managed:
    - source: salt://base/network/files/etc/systemd/network/wireless.network
    - user: root
    - group: root
    - mode: 664

wpa_supplicant:
  pkg.installed

/etc/wpa_supplicant:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 775
    - file_mode: 440
    - recurse:
      - user
      - group
      - mode

{% for interface in salt['grains.get']('ip_interfaces', {}).keys() %}
{% if interface[:2] == 'wl' %}
wpa_supplicant@{{ interface }}:
  service.running:
    - enable: True

/etc/wpa_supplicant/wpa_supplicant-{{ interface }}.conf:
  file.prepend:
    - text:
        - ctrl_interface=/run/wpa_supplicant
        - ctrl_interface_group=wheel
        - update_config=1
        - eapol_version=1
        - ap_scan=1
        - fast_reauth=1
{% endif %}
{% endfor %}
