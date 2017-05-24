packer:
  pkg.installed:
    - name: packer-io
  file.symlink:
    - name: /usr/bin/packer
    - target: /usr/bin/packer-io
