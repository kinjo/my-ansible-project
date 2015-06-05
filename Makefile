define HELP
Available commands:

make allinone			Build all roles for the all-in-one server
make identity			Build identity role only
make image			Build image role only
make compute			Build compute role only
make compute-node		Build compute-node role only
make networking			Build networking role only
make networking-compute-node	Build networking-compute-node role only
make networking-network-node	Build networking-network-node role only
make dashboard			Build dashboard role only
make nat			Build nat roles only
make help			Show help only
endef
export HELP

all: allinone nat

allinone: \
  host \
  ntp \
  repository \
  database \
  messaging \
  identity \
  image \
  compute \
  compute-node \
  networking \
  networking-network-node \
  networking-compute-node \
  dashboard

host: prerequisite
	ansible-playbook playbooks/host.yml
ntp: prerequisite
	ansible-playbook playbooks/ntp.yml
database: prerequisite
	ansible-playbook playbooks/database.yml
messaging: prerequisite
	ansible-playbook playbooks/messaging.yml
repository: prerequisite
	ansible-playbook playbooks/repository.yml
identity: prerequisite
	ansible-playbook playbooks/identity.yml
image: prerequisite
	ansible-playbook playbooks/image.yml
compute: prerequisite
	ansible-playbook playbooks/compute.yml
compute-node: prerequisite
	ansible-playbook playbooks/compute-node.yml
networking: prerequisite
	ansible-playbook playbooks/networking.yml
networking-network-node: prerequisite
	ansible-playbook playbooks/networking-network-node.yml
networking-compute-node: prerequisite
	ansible-playbook playbooks/networking-compute-node.yml
dashboard: prerequisite
	ansible-playbook playbooks/dashboard.yml
tenant: prerequisite
	ansible-playbook playbooks/tenant.yml
nat: prerequisite
	ansible-playbook playbooks/nat.yml
prerequisite:
	@[ -e hosts ] || cp hosts.example hosts
	@[ -e group_vars/all ] || cp group_vars/all.example group_vars/all
help:
	@echo "$$HELP"
