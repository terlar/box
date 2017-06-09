systemd-swap:
  pkg.installed: []
  service.running:
    - enable: True
    - watch:
      - ini: /etc/systemd/swap.conf

swap_enable_zram:
  ini.options_present:
    - name: /etc/systemd/swap.conf
    - sections:
        zswap_enabled: 0
        zram_enabled: 1

swap_enable_swapfc:
  ini.options_present:
    - name: /etc/systemd/swap.conf
    - sections:
        swapfc_enabled: 1
