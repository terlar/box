{%- if salt['pillar.get']('terminals') or salt['pillar.get']('terminal:wms') %}
include:
{% for term in salt['pillar.get']('terminals', []) %}
  - .{{ term }}
{%- endfor %}
{% for wm in salt['pillar.get']('terminal:wms', []) %}
  - .wm.{{ wm }}
{%- endfor %}
{%- endif %}

{%- if salt['pillar.get']('terminal:packages') %}
terminal_packages:
  pkg.installed:
    - pkgs:
{% for pkg in salt['pillar.get']('terminal:packages', []) %}
      - {{ pkg }}
{%- endfor %}
{%- endif %}
