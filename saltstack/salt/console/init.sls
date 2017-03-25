include:
{% if salt['pillar.get']('kmscon:enabled', False) %}
  - .kmscon
{% endif %}
