base:
  '*':
    - common
  'roles:chinese':
    - match: grain
    - chinese
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
