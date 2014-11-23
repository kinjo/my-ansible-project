define HELP
Available commands:

make run			Run setup with ansible.
make first			Run if it's the first time.
make help			Show this help.
endef
export HELP

all: help

run:
	ansible-playbook site.yml
first:
	ansible-playbook site.yml --ask-pass
help:
	@echo "$$HELP"
