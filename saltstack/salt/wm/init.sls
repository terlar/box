xorg-server:
  pkg.installed:
    - name: xorg-server
    - name: xorg-server-utils

{%- if pillar.get('wms') %}
include:
{% for wm in pillar.get('wms', []) %}
  - .{{ wm }}
{%- endfor %}
{%- endif %}
