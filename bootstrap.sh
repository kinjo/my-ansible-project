#!/bin/sh

# Enable swap if unavailable
if [ "$(swapon -s | grep -v ^Filename | wc -l)" = "0" ]; then
  sudo dd if=/dev/zero of=/swapfile bs=1024 count=512k
  sudo mkswap /swapfile
  sudo echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
  sudo swapon -a
fi

# Install Ansible
yum -y install epel-release python-setuptools python-devel sshpass git
yum -y groupinstall "Development Tools"
easy_install pip
pip install --upgrade pip
pip install ansible PyYaML Jinja2
