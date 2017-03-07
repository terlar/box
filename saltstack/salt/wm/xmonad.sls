xmonad:
  pkg.installed

install_xmonad_packages:
  pkg.installed:
    - pkgs:
      - xmonad-contrib
      - xorg-xmessage
