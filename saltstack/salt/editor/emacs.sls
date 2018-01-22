{%- if salt['pkg.version']("emacs-git") == "" %}
emacs:
  pkg.installed
{%- endif %}
