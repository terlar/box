xorg-server:
  pkg.installed

x11_base_packages:
  pkg.installed:
    - pkgs:
      - compton
      - xclip
      - xdg-utils
      - xdotool
      - xfce4-notifyd
      - xorg-utils
      - xorg-xhost
      - xorg-xkill
      - xorg-xrdb
      - xsel
      - zenity
    - require:
      - pkg: xorg-server

x11_tools:
  pkg.installed:
    - pkgs:
        # Screenshots
        - maim
        # Screen selection
        - slop
        # Combined ctrl/escape key
        - xcape

x11_display_packages:
  pkg.installed:
    - pkgs:
      - arandr
      - autorandr-git
      - x-on-resize-git
      - xcalib
    - require:
      - pkg: xorg-server

include:
  - .lightdm

/etc/X11/xorg.conf.d/00-keyboard.conf:
  file.managed:
    - source: salt://gui/x11/files/etc/X11/xorg.conf.d/keyboard.conf.jinja
    - user: root
    - group: root
    - mode: 664
    - makedirs: True
    - template: jinja
    - defaults:
        config: {{ salt['pillar.get']('keyboard', {}) }}
