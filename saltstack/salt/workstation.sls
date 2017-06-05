include:
  - base
  - filesystem
  - gnupg
  - dotfiles
  - editor
  - terminal
  - email
  - calendar
  - fonts
  - browser
  - spell
  - media
  - ebook
  - cm
  - dev
  - recovery
{% if salt['pillar.get']('gui:enabled', False) %}
  - gui
{% endif %}
{% if salt['pillar.get']('sound:enabled', False) %}
  - sound
{% endif %}
{% if salt['pillar.get']('bluetooth:enabled', False) %}
  - bluetooth
{% endif %}
{% if salt['pillar.get']('dropbox:enabled', False) %}
  - dropbox
{% endif %}
{% if salt['pillar.get']('docker:enabled', False) %}
  - docker
{% endif %}
{% if salt['pillar.get']('kubernetes:enabled', False) %}
  - kubernetes
{% endif %}
{% if salt['pillar.get']('yubikey:enabled', False) %}
  - hardware/yubikey
{% endif %}
