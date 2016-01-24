define HELP
Available commands:

make something			Run an example playbook
make roles			Install roles
make help			Show help
endef
export HELP

all: help

something:
	ansible-playbook playbooks/something.yml

roles:
	@[ -n "$$(sed 's/^ *-*\|#.*//g' requirements.yml | grep -v ^$$)" ] && \
	  sudo bash -lc "ansible-galaxy install -i -r requirements.yml" || \
	  echo No role defined.

help:
	@echo "$$HELP"
