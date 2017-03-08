systemd-swap:
  pkg.installed: []
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: systemd-swap
      - ini: /etc/systemd/swap.conf

swap_enable_zram:
  ini.options_present:
    - name: /etc/systemd/swap.conf
    - sections:
        zswap_enabled: 0
        zram_enabled: 1
