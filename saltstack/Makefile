.DEFAULT_GOAL := install

FILE_ROOT   := ./salt/
PILLAR_ROOT := ./pillar/

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
	$(SALT) state.highstate

.PHONY: test
test:
	$(SALT) --log-level=debug state.highstate test=True

.PHONY: test-state
test-state:
	$(SALT) --log-level=debug state.sls $(STATE)
