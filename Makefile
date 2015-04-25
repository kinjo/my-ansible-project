define HELP
Available commands:

make install			Run all tasks
make role			Install roles described in requirements.yml
make help			Show help
endef
export HELP

all: help

install:
	. /opt/ansibleenv/bin/activate && ansible-playbook site.yml
role:
	sudo bash -c ". /opt/ansibleenv/bin/activate && ansible-galaxy install --ignore-errors -r requirements.yml"
help:
	@echo "$$HELP"
