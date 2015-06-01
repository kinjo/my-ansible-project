#!/bin/sh

# Enable swap
if [ "$(swapon -s | wc -l)" = "1" ]; then
  sudo dd if=/dev/zero of=/swapfile bs=1024 count=512k
  sudo mkswap /swapfile
  sudo echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
  sudo swapon -a
fi

# Install Ansible
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get install -y python-dev python-setuptools sshpass git
sudo easy_install pip
sudo pip install virtualenv virtualenvwrapper
sudo virtualenv /opt/ansibleenv
sudo su - -c '. /opt/ansibleenv/bin/activate && pip install ansible PyYaML Jinja2'
