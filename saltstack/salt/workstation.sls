include:
  - base
  - dotfiles
  - editor
  - terminal
  - email
  - fonts
  - wm
  - browser
  - cm
{% if salt['pillar.get']('sound:enabled', False) %}
  - sound
{% endif %}
{% if salt['pillar.get']('bluetooth:enabled', False) %}
  - bluetooth
{% endif %}
{% if salt['pillar.get']('docker:enabled', False) %}
  - docker
{% endif %}
{% if salt['pillar.get']('kubernetes:enabled', False) %}
  - kubernetes
{% endif %}
