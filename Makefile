define HELP
Available commands:

make something			Run the playbook for the something
make role			Install roles described in requirements.yml
make help			Show help
endef
export HELP

all: help

something:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/something.yml
role:
	sudo bash -c ". /opt/ansibleenv/bin/activate && ansible-galaxy install --ignore-errors -r requirements.yml"
help:
	@echo "$$HELP"
