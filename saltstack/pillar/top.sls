{% set roles = salt['grains.get']('roles', []) %}

base:
  '*':
    - common
{%- for role in roles -%}
{% if salt['file.file_exists']('pillar/role/{0}.sls'.format(role)) %}
  'roles:{{ role }}':
    - match: grain
    - role.{{ role }}
{% endif %}
{%- endfor -%}
