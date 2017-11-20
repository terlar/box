lua_dev_packages:
  pkg.installed:
    - pkgs:
      - lua
      - luarocks

install_busted:
  cmd.run:
    - name: luarocks install busted
    - creates:
      - /usr/bin/busted
    - require:
      - pkg: lua_dev_packages
