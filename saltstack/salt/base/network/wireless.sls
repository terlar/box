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

/etc/sudoers.d/wpa_supplicant:
  file.managed:
    - source: salt://base/network/files/etc/sudoers.d/wpa_supplicant
    - user: root
    - group: root
    - mode: 440
    - check_cmd: /usr/sbin/visudo -c -f
    - require:
      - pkg: sudo

/usr/bin/wpa_save:
  file.managed:
    - source: salt://base/network/files/usr/bin/wpa_save
    - user: root
    - group: root
    - mode: 755
