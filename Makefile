define HELP
Available commands:

make run			run all tasks
make install-roles		install roles declared in requirements.yml
make help			show help
endef
export HELP

all: help

run:
	ansible-playbook site.yml
install-role:
	ansible-galaxy install --ignore-errors -r requirements.yml
help:
	@echo "$$HELP"
