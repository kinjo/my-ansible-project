define HELP
Available commands:

make run			run all tasks
make role			install roles declared in requirements.yml
make help			show help
endef
export HELP

all: help

run:
	. /opt/ansibleenv/bin/activate && ansible-playbook site.yml
role:
	. /opt/ansibleenv/bin/activate && ansible-galaxy install --ignore-errors -r requirements.yml
help:
	@echo "$$HELP"
