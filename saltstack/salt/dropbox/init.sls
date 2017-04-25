dropbox:
  pkg.installed

{% for name, user in salt['pillar.get']('users', {}).items()
        if user.get('dropbox_user', False) %}
/etc/systemd/system/dropbox@{{ name }}.service.d/override.conf:
  file.managed:
    - source: salt://dropbox/files/etc/systemd/system/dropbox@.service.d/override.conf
    - user: root
    - group: root
    - mode: 664
    - makedirs: True

# Enable dropbox for user.
dropbox@{{ name }}:
  service.enabled: []
{% endfor %}
