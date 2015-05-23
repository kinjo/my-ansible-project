define HELP
Available commands:

make install			Run all tasks
make help			Show help
endef
export HELP

all: help

install:
	. /opt/ansibleenv/bin/activate && ansible-playbook site.yml
help:
	@echo "$$HELP"
