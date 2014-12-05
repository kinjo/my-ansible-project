Master of my ansible project
====

This is a collection of my programming environments built with Ansible.

It aims to contain various environments such as Ubuntu based, CentOS based and for Ruby reading, Python programming, OpenStack trials, etc.

Usage
---

1. Clone from GitHub

        git clone https://github.com/kinjo/my-ansible-project.git

2. Switch to a branch

        git checkout -b rbenv+ruby origin/rbenv+ruby

3. Vagrant up

        vagrant up

4. Vagrant ssh

        vagrant ssh

5. Build environment

   Type below at a first build.

        cd /vagrant
        make first

   Type "vagrant" when the above command asks for a password.

   On subsequent build, use following command.

        make run
