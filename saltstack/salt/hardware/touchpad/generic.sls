touchpad_generic_packages:
  pkg.installed:
    - pkgs:
      - xf86-input-libinput

/etc/X11/xorg.conf.d/90-libinput.conf:
  file.managed:
    - source: salt://hardware/touchpad/files/etc/X11/xorg.conf.d/libinput.conf
    - user: root
    - group: root
    - mode: 664
    - makedirs: True
