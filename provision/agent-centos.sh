#!/usr/bin/env bash

# Copy the hosts file.
sudo cp /vagrant/config/hosts/hosts.agent-centos /etc/hosts

# Copy the .bashrc files.
cp /vagrant/config/bash/agent-centos.vagrant.bashrc /home/vagrant/.bashrc
sudo cp /vagrant/config/bash/agent-centos.root.bashrc /root/.bashrc

# Install vim, etc.
if [ ! -f /usr/bin/vim ]; then
    sudo yum install -y vim git
fi
