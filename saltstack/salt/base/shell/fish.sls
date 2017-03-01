{%- if salt['pkg.version']("fish-git") == "" %}
fish:
  pkg.installed
{%- endif %}
