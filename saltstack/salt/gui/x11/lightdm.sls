lightdm:
  pkg.installed:
    - pkgs:
      - lightdm
      - lightdm-gtk-greeter
    - require:
      - pkg: xorg-server

/etc/xdg/lightdm/lightdm.conf.d/xserver-command.conf:
  file.managed:
    - source: salt://gui/x11/files/etc/xdg/lightdm/lightdm.conf.d/xserver-command.conf.jinja
    - user: root
    - group: root
    - mode: 664
    - makedirs: True
    - template: jinja
    - defaults:
        ar_delay: {{ salt['pillar.get']('keyboard:repeat_delay', 200) }}
        ar_rate: {{ salt['pillar.get']('keyboard:repeat_rate', 62) }}

/etc/lightdm/lightdm-gtk-greeter.conf:
  ini.options_present:
    - sections:
        greeter:
          background: /usr/share/backgrounds/sky-gradient.png
          theme-name: Arc-solid
          icon-theme-name: Paper
          font-name: Noto Sans 14
