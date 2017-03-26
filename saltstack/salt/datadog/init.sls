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
    - groups:
      - docker

/opt/datadog-agent/setup_agent.sh:
  file.managed:
    - source: https://raw.githubusercontent.com/DataDog/dd-agent/5.12.1/packaging/datadog-agent/source/setup_agent.sh
    - source_hash: b505da7d617ce04b1cacdd49b4048c16cf9a18ccd2093deecdb10a5fba35f1cc
    - mode: 775
    - makedirs: True
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
    - makedirs: True
    - require:
      - cmd: /opt/datadog-agent/setup_agent.sh

datadog-agent:
  service.running:
    - enable: True
    - watch:
      - file: /usr/lib/systemd/system/datadog-agent.service
      - file: /opt/datadog-agent/agent/conf.d/docker_daemon.yaml
    - require:
      - file: /usr/lib/systemd/system/datadog-agent.service

/opt/datadog-agent/agent/conf.d/docker_daemon.yaml:
  file.managed:
    - source: salt://datadog/files/opt/datadog-agent/agent/conf.d/docker_daemon.yaml
    - user: dd-agent
    - group: dd-agent
    - mode: 664
    - makedirs: True
    - require:
      - cmd: /opt/datadog-agent/setup_agent.sh
