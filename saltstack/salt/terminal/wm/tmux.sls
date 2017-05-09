tmux:
  pkg.installed

tmux_packages:
  pkg.installed:
    - pkgs:
      - tmux-xpanes
