xorg-server:
  pkg.installed:
    - name: xorg-server
    - name: xorg-server-utils

{%- if salt['pillar.get']('wms') %}
include:
{% for wm in salt['pillar.get']('wms', []) %}
  - .{{ wm }}
{%- endfor %}
{%- endif %}
