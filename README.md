Master of my ansible project
====

The collection of my development environments built by Ansible.

This aims to include various environments for Ubuntu, CentOS, Ruby programming,
Python programming, etc.

Usage
---

1. Clone from GitHub

        git clone https://github.com/kinjo/my-ansible-project.git

2. Switch to the branch. For example,

        git checkout -b openstack-ubuntu-14.04-kilo origin/openstack-ubuntu-14.04-kilo

3. Vagrant up

        cp Vagrantfile.example Vagrantfile
        vagrant up

4. Vagrant ssh

        vagrant ssh

5. Change directory

        cd /vagrant

6. Prepare templates for the inventory file and the group variables' file

        make prerequisite

7. Install roles if needed

        make role

8. Run default playbook

        make
