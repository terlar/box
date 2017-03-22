mopidy_base_packages:
  pkg.installed:
    - pkgs:
      - mopidy
      - mopidy-scrobbler
      - mopidy-soundcloud
      - mopidy-spotify

mopidy_interface_packages:
  pkg.installed:
    - pkgs:
      - mopidy-iris
      - mpc
      - ncmpcpp
