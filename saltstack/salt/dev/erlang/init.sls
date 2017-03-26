erlang_purge_conflicting_packages:
  pkg.purged:
    - name: erlang

erlang_dev_packages:
  pkg.installed:
    - pkgs:
      - erlang-nox
      - rebar3
