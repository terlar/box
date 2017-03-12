{%- set timezone = salt['pillar.get']('timezone', 'Europe/Berlin') -%}

timezone_packages:
  pkg.installed:
    - name: tzdata

timezone_setting:
  timezone.system:
    - name: {{ timezone }}

timezone_symlink:
  file.symlink:
    - name: /etc/localtime
    - target: /usr/share/zoneinfo/{{ timezone }}
    - force: true
    - require:
      - pkg: tzdata
