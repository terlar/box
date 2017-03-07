xorg-server:
  pkg.installed:
    - name: xorg-server
    - name: xorg-server-utils

include:
{% for wm in pillar.get('wms', []) %}
  - .{{ wm }}
{%- endfor %}
