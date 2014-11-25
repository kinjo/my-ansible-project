#!/bin/sh

# Install Ansible
sudo yum install -y epel-release python-setuptools python-devel sshpass git
sudo easy_install pip
sudo pip install virtualenv virtualenvwrapper
sudo virtualenv /opt/ansibleenv
sudo su - -c '. /opt/ansibleenv/bin/activate && pip install ansible PyYaML Jinja2'
