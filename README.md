DRBL server on Vagrant by ansible
====

The purpose of this repository is that to study the
[DRBL(Diskless Remote Boot in Linux)](http://drbl.org/)
in the Vagrant environment with Ansible.

When you boot a DRBL client, unfortunately, Vagrant can not.
Because the client created from Vagrant cannot boot from NAT
network required by Vagrant to manage the VM.

Thus, You have to create the DRBL client manually in the VirtualBox
and configure the VM to set a Host-only Adapter (such as vboxnet5
that is set to **192.168.33.0/24** and **DHCP disabled**) to
the adapter 1. In addition to that, you have to configure the VM's
**boot order** to allow the VM to boot from the network.

Usage
---

1. Clone from GitHub

        git clone https://github.com/kinjo/my-ansible-project.git

2. Switch to available branch. For example,

        git checkout -b rbenv+ruby origin/rbenv+ruby

3. Vagrant up

        vagrant up

4. Vagrant ssh

        vagrant ssh

5. Install environment

        cd /vagrant
        make install

6. Boot VM as a DRBL client in the VirtualBox
