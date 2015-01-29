#!/bin/sh

# Install Ansible
sudo apt-get install -y python-dev python-pip sshpass
sudo easy_install pip
sudo pip install ansible PyYaML Jinja2
