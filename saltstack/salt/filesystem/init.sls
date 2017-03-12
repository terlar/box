{%- if salt['pillar.get']('filesystems') %}
include:
{% for filesystem in salt['pillar.get']('filesystems', []) %}
  - .{{ filesystem }}
{%- endfor %}
{%- endif %}
