{% for name, user in salt['pillar.get']('users', {}).items() %}
{%- set current = salt.user.info(name) -%}
{%- set home = user.get('home', current.get('home', "/home/%s" % name)) -%}

{%- if 'prime_group' in user and 'name' in user['prime_group'] %}
{%- set user_group = user.prime_group.name -%}
{%- else -%}
{%- set user_group = name -%}
{%- endif %}

{% for group in user.get('groups', []) %}
users_{{ name }}_{{ group }}_group:
  group.present:
    - name: {{ group }}
    {% if group == 'wheel' %}
    - system: True
    {% endif %}
{% endfor %}

users_{{ name }}_user:
  {% if user.get('createhome', True) %}
  file.directory:
    - name: {{ home }}
    - user: {{ user.get('homedir_owner', name) }}
    - group: {{ user.get('homedir_group', user_group) }}
    - mode: {{ user.get('user_dir_mode', '0750') }}
    - require:
      - user: users_{{ name }}_user
      - group: {{ user_group }}
  {%- endif %}
  group.present:
    - name: {{ user_group }}
    {%- if 'prime_group' in user and 'gid' in user['prime_group'] %}
    - gid: {{ user['prime_group']['gid'] }}
    {%- elif 'uid' in user %}
    - gid: {{ user['uid'] }}
    {%- endif %}
    {% if 'system' in user and user['system'] %}
    - system: True
    {% endif %}
  user.present:
    - name: {{ name }}
    - home: {{ home }}
    - shell: {{ user.get('shell', current.get('shell', '/bin/bash')) }}
    {% if 'uid' in user -%}
    - uid: {{ user['uid'] }}
    {% endif -%}
    {% if user.get('system', False) -%}
    - system: True
    {% endif -%}
    {% if 'prime_group' in user and 'gid' in user['prime_group'] -%}
    - gid: {{ user['prime_group']['gid'] }}
    {% elif 'prime_group' in user and 'name' in user['prime_group'] %}
    - gid: {{ user['prime_group']['name'] }}
    {% else -%}
    - gid_from_name: True
    {% endif -%}
    {% if 'fullname' in user %}
    - fullname: {{ user['fullname'] }}
    {% endif -%}
    {% if not user.get('createhome', True) %}
    - createhome: False
    {% endif %}
    - groups:
      - {{ user_group }}
      {% for group in user.get('groups', []) -%}
      - {{ group }}
      {% endfor %}
    - require:
      - group: {{ user_group }}
      {% for group in user.get('groups', []) -%}
      - group: {{ group }}
      {% endfor %}

{% if user.get('createhome', True) %}
{% for directory in user.get('directories', []) %}
users_{{ name }}_{{ directory }}_directory:
  file.directory:
    - name: {{ home }}/{{ directory }}
    - user: {{ user.get('homedir_owner', name) }}
    - group: {{ user.get('homedir_group', user_group) }}
    - mode: {{ user.get('user_dir_mode', '0750') }}
    - require:
      - user: users_{{ name }}_user
      - group: {{ user_group }}
{% endfor %}
{%- endif %}
{% endfor %}
