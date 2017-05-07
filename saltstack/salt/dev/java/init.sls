java_dev_packages:
  pkg.installed:
    - pkgs:
      - beanshell
      - gradle
      - intellij-idea-community-edition
      - java-openjfx
      - javafx-scenebuilder
      - jdee-server-git
      - jdk8-openjdk
      - junit
      - maven
      - openjdk8-src

# Let IntelliJ track changes via inotify for larger projects without
# falling back to recursive scans of directory trees.
java_inotify_watches_limit:
  ini.options_present:
    - name: /usr/lib/sysctl.d/50-default.conf
    - sections:
          fs.inotify.max_user_watches: 524288
  cmd.run:
    - name: sysctl -p --system
    - onchanges:
      - ini: /usr/lib/sysctl.d/50-default.conf
