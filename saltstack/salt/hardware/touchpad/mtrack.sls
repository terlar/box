touchpad_mtrack_packages:
  pkg.installed:
    - pkgs:
      - xf86-input-mtrack-git

/etc/X11/xorg.conf.d/00-touchpad.conf:
  file.managed:
    - source: salt://hardware/touchpad/files/etc/X11/xorg.conf.d/mtrack.conf
    - user: root
    - group: root
    - mode: 664
    - makedirs: True
