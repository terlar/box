javascript_dev_packages:
  pkg.installed:
    - pkgs:
      - nodejs
      - npm
  npm.installed:
    - pkgs:
      - javascript-typescript-langserver
      - wscat
      - wt-cli
      - yarn

javascript_build_tools:
  npm.installed:
    - pkgs:
      - bower
      - gulp

javascript_code_tools:
  npm.installed:
    - pkgs:
      - eslint
      - eslint-plugin-import
      - eslint-config-airbnb-base
      - tern
      - trepanjs
