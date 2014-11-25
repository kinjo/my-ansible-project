#!/bin/sh

# Install Ansible
sudo yum install -y epel-release python-setuptools python-devel
sudo easy_install pip
sudo pip install ansible
sudo yum install -y sshpass
