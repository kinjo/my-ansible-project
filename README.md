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

        git checkout -b rbenv+ruby origin/rbenv+ruby

3. Vagrant up

        vagrant up

4. Vagrant ssh

        vagrant ssh

5. Change directory

        cd /vagrant

6. Install roles

        make role

7. Check available menus to build

        make help

8. Run default playbook

        make
