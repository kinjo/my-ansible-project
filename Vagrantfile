# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |cfg|
  cfg.vm.define "ansible", primary: true do |config|
    config.vm.hostname = "ansible"
    config.vm.box = "trusty-server-cloudimg-amd64-vagrant-disk1"
    config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    config.vm.provision :shell, :path => "bootstrap.sh"
    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1536"]
    end

    # Management network
    config.vm.network "private_network", ip: "10.0.0.254"

    # External network(to do NAT for External net)
    config.vm.network "private_network", ip: "203.0.113.2"
  end

  cfg.vm.define "allinone" do |config|
    config.vm.hostname = "allinone"
    config.vm.box = "trusty-server-cloudimg-amd64-vagrant-disk1"
    config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    config.vm.provision :shell, :path => "bootstrap-tiny.sh"
    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      vb.customize ["modifyvm", :id, "--nicpromisc4", "allow-all"]
    end

    # OpenStack Networking (neutron)
    # See http://docs.openstack.org/juno/install-guide/install/apt/content/ch_basic_environment.html

    # Management network
    config.vm.network "private_network", ip: "10.0.0.11"

    # Tunnel network
    config.vm.network "private_network", ip: "10.0.1.11", auto_config: false

    # External network
    config.vm.network "private_network", ip: "203.0.113.11", auto_config: false
  end

  cfg.vm.define "compute2" do |config|
    config.vm.hostname = "compute2"
    config.vm.box = "trusty-server-cloudimg-amd64-vagrant-disk1"
    config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    config.vm.provision :shell, :path => "bootstrap-tiny.sh"
    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      vb.customize ["modifyvm", :id, "--nicpromisc4", "allow-all"]
    end

    # OpenStack Networking (neutron)
    # See http://docs.openstack.org/juno/install-guide/install/apt/content/ch_basic_environment.html

    # Management network
    config.vm.network "private_network", ip: "10.0.0.12"

    # Tunnel network
    config.vm.network "private_network", ip: "10.0.1.12", auto_config: false
  end
end
