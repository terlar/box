.DEFAULT_GOAL := install

FILE_ROOT   := ./salt/
PILLAR_ROOT := ./pillar/

.PHONY: setup
setup:
	sudo salt-call --local grains.setval roles [workstation]

.PHONY: install
install:
	sudo salt-call --local \
		--file-root=$(FILE_ROOT) \
		--pillar-root=$(PILLAR_ROOT) \
		--output=highstate --state-output=changes \
		--log-level=quiet \
		state.highstate

.PHONY: test
test:
	sudo salt-call --local \
		--file-root=$(FILE_ROOT) \
		--pillar-root=$(PILLAR_ROOT) \
		--output=highstate --state-output=changes \
		--log-level=info \
		state.highstate test=True
