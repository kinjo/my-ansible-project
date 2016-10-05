#!/bin/sh

# Enable swap
if [ "$(swapon -s | grep -v ^Filename | wc -l)" = "0" ]; then
  sudo dd if=/dev/zero of=/swapfile bs=1024 count=512k
  sudo mkswap /swapfile
  sudo echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
  sudo swapon -a
fi

# Upgrade
sudo apt-get update
sudo apt-get dist-upgrade -y

# Prevent locale warning
sudo apt-get install -y language-pack-ja

# Install Ansible
sudo apt-get install -y python-dev python-setuptools sshpass libssl-dev git
sudo easy_install pip
sudo pip install virtualenv virtualenvwrapper cryptography
sudo virtualenv /opt/ansibleenv
cat <<EOF > /etc/profile.d/ansible.sh
echo . /opt/ansibleenv/bin/activate
EOF
sudo su - -c 'pip install ansible PyYaML Jinja2'
