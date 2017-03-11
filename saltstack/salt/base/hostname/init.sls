{%- set hostname = pillar.get('hostname') -%}
{%- set domain = pillar.get('domain', 'localdomain') -%}

/etc/hostname:
  file.managed:
    - contents: {{ hostname }}
    - backup: false

set_fqdn:
  cmd.run:
{% if grains["init"] == "systemd" %}
    - name: hostnamectl set-hostname {{ hostname }}
{% else %}
    - name: hostname {{ hostname }}
{% endif %}
    - unless: hostname | grep -q '\b{{ hostname }}\b'

ipv4_hostnames:
  host.only:
    - name: 127.0.0.1
    - hostnames:
      - localhost
      - {{ hostname }}.{{ domain }}
      - {{ hostname }}

ipv6_hostnames:
  host.only:
    - name: ::1
    - hostnames:
      - localhost
      - {{ hostname }}.{{ domain }}
      - {{ hostname }}
