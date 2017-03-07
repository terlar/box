users:
  terje:
    fullname: Terje Larsen
    shell: /usr/bin/fish
    groups:
      - audio
      - build
      - docker
      - lpadmin
      - scanner
      - tty
      - users
      - video
      - wheel
    dotfiles:
      source: https://github.com/terlar/dotfiles.git
      target: /home/terje/src/github.com/terlar/dotfiles
      init_cmd: make install
    kubeadm_user: True

repos:
  - base
  - communication
  - development
  - fonts
  - games
  - gui
  - hardware
  - media
  - terminal

editors:
  - neovim
  - remacs

terminals:
  - termite
  - st

wms:
  - xmonad

browsers:
  - chromium
  - qutebrowser
