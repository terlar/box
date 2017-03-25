libtsm-patched-git:
  pkg.installed

{%- if salt['pillar.get']('kmscon:font_packages') %}
kmscon_font_packages:
  pkg.installed:
    - pkgs:
{% for pkg in salt['pillar.get']('kmscon:font_packages', []) %}
      - {{ pkg }}
{%- endfor %}
{%- endif %}

kmscon:
  pkg.installed:
    - name: kmscon
    - require:
      - pkg: libtsm-patched-git

# Enable kmscon on tty1
{% if salt['pillar.get']('kmscon:tty1', False) %}
getty@tty1:
  service.disabled
kmsconvt@tty1:
  service.running:
    - enable: True
    - require:
      - pkg: kmscon
{% else %}
kmsconvt@tty1:
  service.disabled
getty@tty1:
  service.running:
    - enable: True
{% endif %}

# Enable kmscon on all virtual terminals
/etc/systemd/system/autovt@.service:
  file.symlink:
    - target: /usr/lib/systemd/system/kmsconvt@.service
    - force: True
    - require:
      - pkg: kmscon

/etc/kmscon/kmscon.conf:
  file.managed:
    - source: salt://console/files/etc/kmscon/kmscon.conf.jinja
    - user: root
    - group: root
    - mode: 664
    - makedirs: True
    - template: jinja
    - defaults:
        config: {{ salt['pillar.get']('kmscon', {}) }}
