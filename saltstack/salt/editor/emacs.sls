emacs:
  pkg.installed:
{%- if salt['pillar.get']('emacs:gui') == 'lucid' %}
    - name: emacs-lucid
{%- else -%}
    - name: emacs
{%- endif %}

emacs_packages:
  pkg.installed:
    - pkgs:
      - cask
