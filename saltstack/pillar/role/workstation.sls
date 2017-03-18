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

packages:
  - aspell
  - aspell-en
  - aspell-sv
  - cryptsetup
  - ddrescue
  - dropbox
  - foremost
  - mopidy
  - mpc
  - pass
  - playpen
  - ripgrep
  - tmsu
  - vdirsyncer
  - xcape
  - youtube-dl

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

doc_packages:
  - antiword
  - calibre
  - pandoc
  - pdfgrep
  - sigil
  - unrtf
  - xsv
  - zathura
  - zathura-pdf-poppler

gui_packages:
  - arandr
  - arc-solid-gtk-theme
  - autopass-git
  - autorandr-git
  - baobab
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
  - shutter
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
  - zenity
  - zim

monitor_packages:
  - cpupower
  - dfc
  - glancing
  - htop
  - httping
  - iftop
  - iotop
  - lshw
  - lsof
  - mtr
  - ncdu
  - perf
  - powertop
  - sysdig
  - usbutils

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

hardware:
  # Apple Cinema Display Control Utility
  - acdcontrol-git
  - cups
  - epson-inkjet-printer-stylus-photo-px810fw-series
  - gutenprint
  - ifuse
  - joyutils
  - opensc
  - xf86-input-mtrack-git
  - xf86-video-intel
  - yubikey-neo-manager-git
  - yubikey-personalization-gui

passwordless_sudo:
  - /usr/bin/pacman -Syu
  - /usr/bin/systemctl daemon-reload
  - /usr/bin/systemctl start *
  - /usr/bin/systemctl restart *
  - /usr/bin/systemctl stop *

bootloader: systemd-boot

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
