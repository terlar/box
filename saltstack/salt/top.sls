base:
  '*':
    - common
  'roles:console':
    - match: grain
    - console
  'roles:workstation':
    - match: grain
    - workstation
  'blackbird*':
    - dell-xps
  'falcon*':
    - macbook
