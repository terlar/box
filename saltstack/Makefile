.DEFAULT_GOAL := install

FILE_ROOT   := ./salt/
PILLAR_ROOT := ./pillar/
LOG_LEVEL   := warning

SALT := sudo salt-call --local \
	--file-root=$(FILE_ROOT) --pillar-root=$(PILLAR_ROOT) \
	--output=highstate --state-output=changes

.PHONY: setup
setup:
	sudo salt-call --local grains.setval roles [workstation]

.PHONY: apply
apply:
	$(SALT) state.sls $(STATE)

.PHONY: install
install:
	$(SALT) --log-level=$(LOG_LEVEL) state.highstate

.PHONY: test
test:
	$(SALT) --log-level=debug state.highstate test=True

.PHONY: test-state
test-state:
	$(SALT) --log-level=debug state.sls $(STATE)

.PHONY: install-datadog
install-datadog:
ifndef DD_API_KEY
	$(error DD_API_KEY required)
endif
	@$(SALT) state.sls datadog pillar="{datadog: {api_key: '$(DD_API_KEY)'}}"
