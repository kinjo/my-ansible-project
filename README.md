Master of my ansible project
====

A collection of my development environments built by Ansible.

It aims to contain various environments such as Ubuntu based, CentOS based and for Ruby reading, Python programming, trial of OpenStack, etc.

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

   Type following commands in Vagrant virtual machine to install dependent roles.

        cd /vagrant
        make role

   Finally, run `make install` to install environment.

        make install
