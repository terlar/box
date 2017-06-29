systemd-swap:
  pkg.installed: []
  service.running:
    - enable: True
    - watch:
      - file: /etc/systemd/swap.conf

swap_disable_zram:
  file.replace:
    - name: /etc/systemd/swap.conf
    - pattern: '(?<=^zram_enabled=)(\d)'
    - repl: '0'
    - unless: grep '^zram_enabled=0$' /etc/systemd/swap.conf

swap_enable_zram:
  file.replace:
    - name: /etc/systemd/swap.conf
    - pattern: '(?<=^zswap_enabled=)(\d)'
    - repl: '1'
    - unless: grep '^zswap_enabled=1$' /etc/systemd/swap.conf

swap_enable_swapfc:
  file.replace:
    - name: /etc/systemd/swap.conf
    - pattern: '(?<=^swapfc_enabled=)(\d)'
    - repl: '1'
    - unless: grep '^swapfc_enabled=1$' /etc/systemd/swap.conf

swap_set_swapfc_max_count:
  file.replace:
    - name: /etc/systemd/swap.conf
    - pattern: '(?<=^swapfc_max_count=)(\d+)'
    - repl: '32'
    - unless: grep '^swapfc_max_count=32$' /etc/systemd/swap.conf
