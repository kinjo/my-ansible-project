Study the OpenStack Installation Guide for Ubuntu 14.04 - Juno
====

This is to study [the OpenStack Installation Guide for Ubuntu 14.04 - Juno](http://docs.openstack.org/juno/install-guide/install/apt/content/index.html).

Any tasks to build OpenStack services are written in accordance with the Guide
as much as possible.

However, There are some points of difference between the guide and the tasks as
following.

* Build an all-in-one server in now
* Use VirtualBox and Vagrant and Ansible in order to save time andeffort for
  getting the new machine
* Use qemu instead of KVM
* There is an additional server named ansible to run the Ansible tasks
* The ansible server also acts as a router to NAT the external network to use
  same network address just like the guide

The architecture of the environment built as a result of the tasks is below.

                                            VirtualBox NAT Network(for Vagrant)
    ----------+----------------------------+-----------------------------------
              |                            |
          eth0|                        eth0|
    +---------+------------+   +-----------+------------+
    |HOST: ansible(512MB)  |   |HOST: allinone(4GB mem) |
    | Acts as router       |   | Acts as                |
    |                      |   |  controller/network/   |
    |                      |   |  compute node          |
    +----------------------+   +------------------------+
    |ROLES:                |   |ROLES:                  |
    | nat(for external net)|   | ntp                    |
    +----+---------+-------+   | database               |
     eth1|     eth2|           | messaging              |
     .254|       .2|           | identity               |
         |         |           | image                  |
         |         |           | compute                |
         |         |           | compute-node           |
         |         |           | networking             |
         |         |           | networking-network-node|
         |         |           | networking-compute-node|
         |         |           | dashboard              |
         |         |           | tenant                 |
         |         |           +---+------+-----+-------+
         |         |           eth1|  eth2| eth3|    VirtualBox Private Network
         |         |            .11|   .11|     |  (for Tunnel net) 10.0.1.0/24
         |         |               |  ----+-----)------------------------------
         |         |               |            |    VirtualBox Private Network
         |         |               |            | (External net) 203.0.113.0/24
         |     ----+---------------)------------+------------------------------
         |                         |                 VirtualBox Private Network
         |                         |               (Management net) 10.0.0.0/24
    -----+-------------------------+-------------------------------------------

Usage
---

1. Clone from GitHub

        git clone https://github.com/kinjo/my-ansible-project.git

2. Switch the branch and update the submodule

        git checkout -b openstack-ubuntu-14.04-juno \
          origin/openstack-ubuntu-14.04-juno
        git submodule init
        git submodule update

3. Vagrant up

        vagrant up

4. Login to the virtual machine named ansible

        vagrant ssh

5. Change directory

        cd /vagrant

6. Prepare templates for the inventory file and the group variables' file

        make prerequisite

7. Install OpenStack

        make

8. Access to the following URL to see the Dashboard

    http://10.0.0.11/horizon/
