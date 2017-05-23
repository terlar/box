haskell_dev_packages:
  pkg.installed:
    - pkgs:
      - ghc
      - ghc-mod
      - stack

{% for name, user in salt['pillar.get']('users', {}).items() %}
{%- set current = salt.user.info(name) -%}
{%- set home = user.get('home', current.get('home', "/home/%s" % name)) -%}
haskell_stack_setup_for_{{ name }}:
  cmd.run:
    - name: stack setup
    - runas: {{ name }}
    - creates:
      - {{ home }}/.stack/programs

{% for pkg in user.get('stack_packages', []) %}
haskell_stack_package_{{ pkg }}_for_{{ name }}:
  cmd.run:
    - name: stack install {{ pkg }}
    - runas: {{ name }}
    - creates:
      - {{ home }}/.local/bin/{{ pkg }}
{% endfor %}
{% endfor %}
