define HELP
Available commands:

make                          Build all
make identity                 Build identity service only
make image                    Build image service only
make compute                  Build compute service only
make compute-node             Build compute-node only
make networking               Build networking service only
make networking-network-node  Build networking-network-node only
make networking-compute-node  Build networking-compute-node only
make tenant-network           Build tenant-network only
make dashboard                Build dashboard only
make nat                      Build NAT networking only
make help                     Show help
endef
export HELP

.PHONY: hosts

all: openstack nat

openstack: \
  hosts \
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
  tenant-network \
  dashboard

hosts:
	ansible-playbook playbooks/hosts.yml

ntp:
	ansible-playbook playbooks/ntp.yml

database:
	ansible-playbook playbooks/database.yml

messaging:
	ansible-playbook playbooks/messaging.yml

repository:
	ansible-playbook playbooks/repository.yml

identity:
	ansible-playbook playbooks/identity.yml

image:
	ansible-playbook playbooks/image.yml

compute:
	ansible-playbook playbooks/compute.yml

compute-node:
	ansible-playbook playbooks/compute-node.yml

networking:
	ansible-playbook playbooks/networking.yml

networking-network-node:
	ansible-playbook playbooks/networking-network-node.yml

networking-compute-node:
	ansible-playbook playbooks/networking-compute-node.yml

dashboard:
	ansible-playbook playbooks/dashboard.yml

tenant-network:
	ansible-playbook playbooks/tenant-network.yml

nat:
	ansible-playbook playbooks/nat.yml

prerequisite:
	@[ -e hosts ] || cp hosts.example hosts
	@[ -e group_vars/all ] || cp group_vars/all.example group_vars/all

help:
	@echo "$$HELP"
