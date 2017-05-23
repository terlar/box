javascript_dev_packages:
  pkg.installed:
    - pkgs:
      - nodejs
      - npm
  npm.installed:
    - pkgs:
      - wscat
      - wt-cli

javascript_build_tools:
  npm.installed:
    - pkgs:
      - bower
      - gulp

javascript_code_tools:
  npm.installed:
    - pkgs:
      - eslint
      - jshint
      - tern

"@angular/cli@1.0.4":
  npm.installed: []
