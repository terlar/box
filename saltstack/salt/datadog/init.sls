datadog_packages:
  pkg.installed:
    - pkgs:
      - sysstat

datadog_user:
  user.present:
    - name: dd-agent
    - shell: /sbin/nologin
    - home: /opt/datadog-agent
    - system: True

/opt/datadog-agent/setup_agent.sh:
  file.managed:
    - source: https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/setup_agent.sh
    - source_hash: cbb741ef07c6b644f63d07585e71154df61bc143f194bd6b7535538e70b70f0a
    - mode: 775
    - runas: dd-agent
  cmd.run:
    - shell: /bin/bash
    - env:
      - DD_HOME: "/opt/datadog-agent"
      - DD_START_AGENT: "0"
      - DD_API_KEY: "{{ pillar['datadog']['api_key'] }}"
    - runas: dd-agent
    - creates:
      - /opt/datadog-agent/agent
      - /opt/datadog-agent/bin/agent
    - require:
      - file: /opt/datadog-agent/setup_agent.sh

/usr/lib/systemd/system/datadog-agent.service:
  file.managed:
    - source: salt://datadog/files/usr/lib/systemd/system/datadog-agent.service
    - user: root
    - group: root
    - mode: 664

datadog-agent:
  service.running:
    - enable: True
    - watch:
      - file: /usr/lib/systemd/system/datadog-agent.service
