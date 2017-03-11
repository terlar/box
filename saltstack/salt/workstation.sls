include:
  - base
  - dotfiles
  - editor
  - terminal
  - fonts
  - wm
  - browser
{% if salt['pillar.get']('bluetooth:enabled', False) %}
  - bluetooth
{% endif %}
{% if salt['pillar.get']('docker:enabled', False) %}
  - docker
{% endif %}
{% if salt['pillar.get']('kubernetes:enabled', False) %}
  - kubernetes
{% endif %}
