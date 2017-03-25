base:
  '*':
    - common
  'roles:workstation':
    - match: grain
    - workstation
  'blackbird.*':
    - dell-xps
  'falcon.*':
    - macbook
