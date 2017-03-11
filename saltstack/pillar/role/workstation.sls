hostname: horse
domain: farm
timezone: Europe/Stockholm

users:
  terje:
    fullname: Terje Larsen
    shell: /usr/bin/fish
    groups:
      - audio
      - build
      - docker
      - lp
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
  - st
  - termite

wms:
  - sway
  - xmonad

browsers:
  - chromium
  - qutebrowser

fonts:
  - ttf-dejavu
  - ttf-freefont
  - ttf-indic-otf
  - ttf-liberation
  - ttf-linux-libertine
  - ttf-symbola
  - ttf-tibetan-machine

dnsmasq:
  enabled: True

journal:
  max_size: 16M
