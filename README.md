Master of my ansible project
====

The collection of my development environments built by Ansible.

This aims to include various environments for Ubuntu, CentOS, Ruby programming,
Python programming, etc.

Usage
---

1. Clone from GitHub.

        git clone https://github.com/kinjo/my-ansible-project.git

2. Switch to objective branch.

        git checkout -b openstack-ubuntu-14.04-kilo origin/openstack-ubuntu-14.04-kilo

3. Prepare required files.

        make -f Makefile.example prepare

4. Run vagrant up.

        vagrant up

5. Run vagrant ssh

        vagrant ssh

6. Change directory in running virtual machine.

        cd /vagrant

7. Show build menu.

        make
