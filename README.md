Master of my ansible project
====

This is a collection of my programming environments built with Ansible.

It aims to contain various environments such as Ubuntu based, CentOS based and for Ruby reading, Python programming, OpenStack trials, etc.

Usage
---

1. Clone from GitHub

        git clone https://github.com/kinjo/my-ansible-project.git

2. Switch to branch

        git checkout -b rbenv+ruby origin/rbenv+ruby

3. Vagrant up

        vagrant up

4. Vagrant ssh

        vagrant ssh

5. Build environment

   Type following commands in Vagrant virtual machine to install dependent roles.

        cd /vagrant
        make install-role

   Finally, run ansible-playbook to build environment.

        make run
