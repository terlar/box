{% if not 'dnsmasq' in salt['pillar.get']('network:features', []) %}
/etc/resolv.conf:
  file.symlink:
    - target: /run/systemd/resolve/resolv.conf
{% endif %}

systemd-resolved:
  service.running:
    - enable: True

systemd-networkd:
  service.running:
    - enable: True

include:
  - .wired
  - .wireless
{% if 'dnsmasq' in salt['pillar.get']('network:features', []) %}
  - .dnsmasq
{% endif %}
{% if 'zero-conf' in salt['pillar.get']('network:features', []) %}
  - .zero-conf
{% endif %}

/usr/lib/systemd/system/wait-for-dns.service:
  file.managed:
    - source: salt://base/network/files/usr/lib/systemd/system/wait-for-dns.service
    - user: root
    - group: root
    - mode: 664

wait-for-dns:
  service.running:
    - enable: True
    - watch:
      - file: /usr/lib/systemd/system/wait-for-dns.service

{%- if salt['pillar.get']('network:packages') %}
network_packages:
  pkg.installed:
    - pkgs:
{% for pkg in salt['pillar.get']('network:packages', []) %}
      - {{ pkg }}
{%- endfor %}
{%- endif %}
