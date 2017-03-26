yubikey-manager:
  pkg.installed

yubikey_u2f_packages:
  pkg.installed:
    - pkgs:
      - libu2f-host

yubikey_smartcard_packages:
  pkg.installed:
    - pkgs:
      - ccid
      - libusb-compat
      - pcsc-tools

pcscd:
  service.running:
    - enable: True
    - require:
      - pkg: yubikey_smartcard_packages
