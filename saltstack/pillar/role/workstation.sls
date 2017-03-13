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

vcs:
  - git
  - mercurial

cm:
  - ansible
  - salt

dev:
  languages:
    - bash
    - elixir
    - erlang
    - go
    - haskell
    - java
    - javascript
    - python
    - ruby
    - rust
    - web
  packages:
    - aws-cli
    - ctags
    - exercism-cli
    - ftjam
    - gdb
    - http-prompt
    - httpie
    - jq
    - mosh
    - mycli
    - plantuml
    - tmate
    - vagrant
    - vegeta
    - virtualbox

terminal:
  packages:
    - arch-wiki-lite
    - asciinema
    - calc
    - canto-curses
    - cdrtools
    - cmatrix
    - exa-git
    - figlet
    - fzf
    - grc
    - icat
    - khal
    - libqalculate
    - mange
    - mlocate
    - moc
    - most
    - ncmpcpp
    - progress
    - pv
    - pwgen
    - pygmentize
    - ranger
    - reptyr
    - rlwrap
    - translate-shell
    - tree
    - units
    - w3m
    - weechat
    - yank
  wms:
    - dvtm
    - tmux

filesystems:
  - exfat
  - ext
  - ntfs

dnsmasq:
  enabled: True

sound:
  enabled: True
  features:
    - dlna
    - raop

bluetooth:
  enabled: True

docker:
  enabled: True

kubernetes:
  enabled: False

journal:
  max_size: 16M
