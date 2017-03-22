aspell_packages:
  pkg.installed:
    - pkgs:
      - aspell
      - aspell-en
{% for lang in salt['pillar.get']('languages', []) %}
      - aspell-{{ lang }}
{%- endfor %}

hunspell_packages:
  pkg.installed:
    - pkgs:
      - hunspell
      - hunspell-en
{% for lang in salt['pillar.get']('languages', []) %}
      - hunspell-{{ lang }}
{%- endfor %}
