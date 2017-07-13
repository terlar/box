rust_dev_packages:
  pkg.installed:
    - pkgs:
      - rust-racer
      - rust-src
      - rustfmt
      - rustup

{% for name, user in salt['pillar.get']('users', {}).items()
        if user.get('rust_user', False) %}
{%- set current = salt.user.info(name) -%}
{%- set home = current.get('home', "/home/%s" % name) -%}
# Configure default toolchain
rust_rustup_toolchain:
  cmd.run:
    - name: rustup default stable
    - unless: grep default_toolchain ~/.rustup/settings.toml
    - runas: {{ name }}
{% endfor %}
