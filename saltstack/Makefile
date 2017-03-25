.DEFAULT_GOAL := install

FILE_ROOT   := ./salt/
PILLAR_ROOT := ./pillar/
LOG_LEVEL   := warning

ROLES := workstation

ifdef PILLAR
PILLAR_OPT := pillar="$(PILLAR)"
endif

SALT := sudo salt-call --local \
	--file-root=$(FILE_ROOT) --pillar-root=$(PILLAR_ROOT) \
	--output=highstate --state-output=changes

.PHONY: setup
setup:
	sudo salt-call --local grains.setval roles [$(ROLES)]

.PHONY: apply
apply:
	$(SALT) state.sls $(STATE) $(PILLAR_OPT)

.PHONY: install
install:
	$(SALT) --log-level=$(LOG_LEVEL) state.highstate $(PILLAR_OPT)

.PHONY: test
test:
	$(SALT) --log-level=debug state.highstate test=True $(PILLAR_OPT)

.PHONY: test-state
test-state:
	$(SALT) --log-level=debug state.sls $(STATE) $(PILLAR_OPT)

.PHONY: install-datadog
install-datadog:
ifndef DD_API_KEY
	$(error DD_API_KEY required)
endif
	@$(SALT) state.sls datadog pillar="{datadog: {api_key: '$(DD_API_KEY)'}}"
