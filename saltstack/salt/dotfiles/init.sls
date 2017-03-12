stow:
  pkg.installed

{% for name, user in salt['pillar.get']('users', {}).items()
        if user.dotfiles is defined %}
{%- set dotfiles = user.dotfiles -%}
{%- set current = salt.user.info(name) -%}
{%- set home = current.get('home', "/home/%s" % name) -%}
{%- set target = dotfiles.get('target', "%s/.dotfiles" % home) -%}

dotfiles_repo_for_{{ name }}_user:
  git.latest:
    - name: {{ dotfiles.source }}
    - target: {{ target }}
    - user: {{ name }}
    - update_head: False
    - submodules: True
    - require:
      - pkg: git

{%- if dotfiles.init_cmd is defined %}
initialize_dotfiles_for_{{ name }}_user:
  cmd.run:
    - name: {{ dotfiles.init_cmd }}
    - cwd: {{ target }}
    - runas: {{ name }}
    - onchanges:
      - git: dotfiles_repo_for_{{ name }}_user
{%- endif %}
{% endfor %}
