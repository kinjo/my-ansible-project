Master of my ansible project
====

The collection of my environments built with Ansible.

This aims to collect various environments for Ruby or
Python programming on Ubuntu, CentOS, etc.

Usage
---

1. Clone from GitHub

        git clone https://github.com/kinjo/my-ansible-project.git

2. Switch to desired branch like this

        git checkout -b centos-7 origin/centos-7

3. Vagrant up

        vagrant up

4. Vagrant ssh

        vagrant ssh

5. Change directory to synced folder

        cd ~/sync

6. Copy hosts.example to hosts

        cp hosts.example hosts

7. Install roles if defined in requirements.yml

        make role

8. Run default playbook

        make help
