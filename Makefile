define HELP
Available commands:

make something			Run example playbook
make role			Install roles
make help			Show help
endef
export HELP

all: help

something:
	ansible-playbook playbooks/something.yml

prerequisite:
	@[ -e hosts ] || cp hosts.example hosts

role:
	@[ -n "$$(sed 's/^ *-*\|#.*//g' requirements.yml | grep -v ^$$)" ] && \
	  sudo bash -lc "ansible-galaxy install -i -r requirements.yml" || \
	  echo There is no role defined.

help:
	@echo "$$HELP"
