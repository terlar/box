xorg-server:
  pkg.installed

x_packages:
  pkg.installed:
    - pkgs:
      - arandr
      - autorandr-git
      - xcalib
      - xcape
      - xclip
      - xcompmgr
      - xdg-utils
      - xdotool
      - xfce4-notifyd
      - xorg-server-utils
      - xorg-utils
      - xorg-xkill
      - xsel
      - zenity

{%- if salt['pillar.get']('gui:wms') %}
include:
{% for wm in salt['pillar.get']('gui:wms', []) %}
  - .{{ wm }}
{%- endfor %}
{%- endif %}
