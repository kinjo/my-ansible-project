#!/bin/sh

# Enable swap if unavailable
if [ "$(swapon -s | grep -v ^Filename | wc -l)" = "0" ]; then
  sudo dd if=/dev/zero of=/swapfile bs=1024 count=512k
  sudo mkswap /swapfile
  sudo echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
  sudo swapon -a
fi

# Update packages
yum update

# Install Ansible
sudo yum install -y epel-release python-setuptools python-devel sshpass git
sudo yum groupinstall -y "Development Tools"
sudo easy_install pip
sudo pip install virtualenv virtualenvwrapper
sudo virtualenv /opt/ansibleenv
cat <<EOF > /etc/profile.d/ansible.sh
echo . /opt/ansibleenv/bin/activate
EOF
sudo su - -c 'pip install ansible PyYaML Jinja2'
