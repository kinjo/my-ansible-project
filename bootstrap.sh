#!/bin/sh

# Install Ansible
sudo apt-get install -y python-dev python-pip sshpass git
sudo easy_install pip
sudo pip install virtualenv virtualenvwrapper
sudo virtualenv /opt/ansibleenv
sudo su - -c '. /opt/ansibleenv/bin/activate && pip install ansible PyYaML Jinja2'
