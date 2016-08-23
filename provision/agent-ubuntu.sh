#!/usr/bin/env bash

# Copy the hosts file.
sudo cp /vagrant/config/hosts/hosts.agent-ubuntu /etc/hosts

# Copy the .bashrc files.
cp /vagrant/config/bash/agent-ubuntu.vagrant.bashrc /home/vagrant/.bashrc
sudo cp /vagrant/config/bash/agent-ubuntu.root.bashrc /root/.bashrc

# Install git, etc.
if [ ! -f /usr/bin/git ]; then
    sudo apt-get update
    sudo apt-get install -y git
fi
