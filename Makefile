define HELP
Available commands:

make first			run at first time
make run			run entire tasks
make help			show help
endef
export HELP

all: help

first:
	ansible-playbook site.yml --ask-pass
run:
	ansible-playbook site.yml
help:
	@echo "$$HELP"
