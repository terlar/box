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
    - moc
    - most
    - ncmpcpp
    - pandoc
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
  packages:
    - arandr
    - arc-solid-gtk-theme
    - autopass-git
    - autorandr-git
    - baobab
    - calibre
    - cheese
    - compton
    - darktable
    - deluge
    - editorconfig-core-c
    - feh
    - filelight
    - font-manager
    - gcolor2
    - gnome-themes-standard
    - goldendict
    - gpicview
    - i3lock
    - ibus
    - ibus-m17n
    - libreoffice-fresh
    - lightdm
    - lightdm-gtk-greeter
    - lxrandr
    - meld
    - mpv
    - nautilus
    - numix-gtk-theme
    - pavucontrol
    - pidgin
    - pidgin-libnotify
    - pinta
    - redshift
    - rofi
    - rofi-surfraw-git
    - scrot
    - shotwell
    - sigil
    - slack-desktop
    - spotify
    - spread0r
    - xcalib
    - xclip
    - xcompmgr
    - xdg-utils
    - xdotool
    - xfce4-notifyd
    - xorg-utils
    - xorg-xkill
    - xsel
    - zathura
    - zathura-pdf-poppler
    - zenity
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
