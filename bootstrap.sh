#!/bin/sh

# Install Ansible
sudo apt-get install -y python-setuptools python-dev
sudo easy_install pip
sudo pip install ansible
sudo apt-get install -y sshpass
