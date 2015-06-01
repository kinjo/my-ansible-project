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
make tenant			Build tenant role only
make nat			Build nat roles only
make help			Show help only
endef
export HELP

all: allinone nat

allinone: \
  host \
  ntp \
  database \
  messaging \
  repository \
  identity \
  image \
  compute \
  compute-node \
  networking \
  networking-network-node \
  networking-compute-node \
  dashboard \
  tenant

host:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/host.yml
ntp:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/ntp.yml
database:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/database.yml
messaging:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/messaging.yml
repository:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/repository.yml
identity:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/identity.yml
image:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/image.yml
compute:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/compute.yml
compute-node:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/compute-node.yml
networking:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/networking.yml
networking-network-node:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/networking-network-node.yml
networking-compute-node:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/networking-compute-node.yml
dashboard:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/dashboard.yml
tenant:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/tenant.yml
nat:
	. /opt/ansibleenv/bin/activate && ansible-playbook playbooks/nat.yml
help:
	@echo "$$HELP"
