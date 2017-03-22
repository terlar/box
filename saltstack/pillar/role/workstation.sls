hostname: horse
domain: farm
timezone: Europe/Stockholm
languages:
  - sv

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

grep: ripgrep

editors:
  - neovim
  - remacs

terminals:
  - st
  - termite

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
    - editorconfig-core-c
    - exercism-cli
    - ftjam
    - gdb
    - http-prompt
    - httpie
    - jq
    - mosh
    - mycli
    - packer-io
    - plantuml
    - tmate
    - vagrant
    - vegeta
    - virtualbox
    - wercker-cli

network:
  features:
    - dnsmasq
    - zero-conf
  packages:
    - bind-tools
    - ca-certificates
    - curl
    - gnu-netcat
    - lftp
    - net-tools
    - openssh
    - openssl
    - rsync
    - socat
    - tcpdump
    - traceroute
    - whois

terminal:
  packages:
    - antiword
    - arch-wiki-lite
    - asciinema
    - calc
    - cdrtools
    - cmatrix
    - exa-git
    - figlet
    - fzf
    - grc
    - icat
    - khal
    - lastpass-cli
    - libqalculate
    - mlocate
    - most
    - mux
    - pandoc
    - pass
    - pdfgrep
    - progress
    - pv
    - pwgen
    - pygmentize
    - ranger
    - reptyr
    - rlwrap
    - tabview
    - translate-shell
    - tree
    - units
    - unrtf
    - w3m
    - weechat
    - xsv
    - yank
  wms:
    - dvtm
    - tmux

gui:
  enabled: True
  themes:
    - arc-solid
    - numix
  packages:
    - autopass-git
    - cheese
    - deluge
    - font-manager
    - gcolor2
    - goldendict
    - i3lock
    - ibus
    - ibus-m17n
    - libreoffice-fresh
    - lightdm
    - lightdm-gtk-greeter
    - meld
    - nautilus
    - pidgin
    - pidgin-libnotify
    - redshift
    - rofi
    - rofi-surfraw-git
    - scrot
    - slack-desktop
    - spread0r
    - zim
  wms:
    - sway
    - xmonad

passwordless_sudo:
  - /usr/bin/pacman -Syu
  - /usr/bin/systemctl daemon-reload
  - /usr/bin/systemctl start *
  - /usr/bin/systemctl restart *
  - /usr/bin/systemctl stop *

filesystems:
  - exfat
  - ext
  - ntfs

sound:
  enabled: True
  features:
    - dlna
    - raop

bluetooth:
  enabled: True
  auto_enable: True

docker:
  enabled: True

kubernetes:
  enabled: False

journal:
  max_size: 16M
