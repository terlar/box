domain: farm
timezone: Europe/Stockholm
languages:
  - sv
keyboard:
  layout: us
  caps_ctrl: True
  repeat_delay: 200
  repeat_rate: 25
display:
  dpi: 166

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
    directories:
      - documents
      - downloads
      - music
      - pictures
      - videos
    dropbox_user: True
    kubeadm_user: True
    rust_user: True
    stack_packages:
      - intero
      - structured-haskell-mode
      - stylish-haskell

mirrors:
  limit: 100
  count: 5
  protocols:
    - https
  countries:
    - Sweden
    - Norway
    - Denmark
    - Finland
    - Germany

repo_keys:
  - 89AF679B037E1D2A

repos:
  - name: base
    server: https://s3.eu-central-1.amazonaws.com/yak-packages/$repo/os/$arch
  - name: communication
    server: https://s3.eu-central-1.amazonaws.com/yak-packages/$repo/os/$arch
  - name: development
    server: https://s3.eu-central-1.amazonaws.com/yak-packages/$repo/os/$arch
  - name: fonts
    server: https://s3.eu-central-1.amazonaws.com/yak-packages/$repo/os/$arch
  - name: gui
    server: https://s3.eu-central-1.amazonaws.com/yak-packages/$repo/os/$arch
  - name: hardware
    server: https://s3.eu-central-1.amazonaws.com/yak-packages/$repo/os/$arch
  - name: media
    server: https://s3.eu-central-1.amazonaws.com/yak-packages/$repo/os/$arch
  - name: terminal
    server: https://s3.eu-central-1.amazonaws.com/yak-packages/$repo/os/$arch

grep: ripgrep

editors:
  - neovim
  - emacs

terminals:
  - st
  - termite

browsers:
  - chromium
  - qutebrowser
  - uzbl

fonts:
  - noto-fonts
  - ttf-dejavu
  - ttf-fantasque-sans
  - ttf-fira-code
  - ttf-fira-mono
  - ttf-fira-sans
  - ttf-freefont
  - ttf-indic-otf
  - ttf-liberation
  - ttf-linux-libertine
  - ttf-symbola
  - ttf-tibetan-machine
  - emojione-color-font
  - ttf-font-awesome
  - ttf-material-design-icons
  - ttf-weather-icons
  - ttf-octicons
  - ttf-atom-file-icons
  - ttf-all-the-icons
  - ttf-icomoon
  - ttf-mfizz

vcs:
  - git
  - mercurial

cm:
  - ansible
  - salt

dev:
  tools:
    - database
    - packer
  languages:
    - bash
    - elixir
    - elm
    - erlang
    - go
    - haskell
    - java
    - javascript
    - lua
    - python
    - ruby
    - rust
    - scala
    - web
  packages:
    - aws-cli
    - ctags
    - editorconfig-core-c
    - exercism-cli
    - ftjam
    - gdb
    - global
    - harcurl
    - hey-git
    - http-prompt
    - httpie
    - jq
    - mosh
    - mycli
    - plantuml
    - python-pygments
    - the_silver_searcher
    - tmate
    - vagrant
    - vegeta
    - virtualbox
    - wercker-cli
    - yamllint
    - zeal

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
    - pssh
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
    - fzy
    - grc
    - icat
    - lastpass-cli
    - libqalculate
    - mlocate
    - most
    - mux
    - pandoc
    - pass
    - pdfgrep
    - procmail
    - progress
    - pv
    - pwgen
    - pygmentize
    - ranger
    - recordmydesktop
    - reptyr
    - rlwrap
    - speedread-git
    - tabview
    - tldr
    - translate-shell
    - tree
    - ttygif
    - ttyrec
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
    - paper
  packages:
    - anki
    - autopass-git
    - cheese
    - deluge
    - font-manager
    - franz-bin
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
    - telegram-purple
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

disk_encryption: True

filesystems:
  - afp
  - exfat
  - ext
  - fat
  - iso
  - ntfs
  - ssh
  - tmsu

sound:
  enabled: True
  features:
    - bluetooth
    - dlna

bluetooth:
  enabled: True
  auto_enable: True

dropbox:
  enabled: True

docker:
  enabled: True

kubernetes:
  enabled: False

yubikey:
  enabled: True

journal:
  max_size: 16M
