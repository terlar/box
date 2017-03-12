{%- if 'raop' in salt['pillar.get']('sound:features', []) %}
{%- set pkgname = 'pulseaudio-raop2' -%}
{%- else -%}
{%- set pkgname = 'pulseaudio' -%}
{%- endif %}

alsa-utils:
  pkg.installed

pulseaudio:
  pkg.installed:
    - pkgs:
      - {{ pkgname }}
      - pulseaudio-alsa
{% if 'dlna' in salt['pillar.get']('sound:features', []) %}
      - pulseaudio-dlna
{% endif %}

pulseaudio_switch_on_connect:
  file.append:
    - name: /etc/pulse/default.pa
    - text:
      - load-module module-switch-on-connect
