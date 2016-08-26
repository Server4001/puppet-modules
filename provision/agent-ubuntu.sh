#!/usr/bin/env bash

# Copy the hosts file.
sudo cp /vagrant/config/hosts/hosts.agent-ubuntu /etc/hosts

# Copy the .bashrc files.
cp /vagrant/config/bash/agent-ubuntu.vagrant.bashrc /home/vagrant/.bashrc
sudo cp /vagrant/config/bash/agent-ubuntu.root.bashrc /root/.bashrc

# Install git, etc.
if [ ! -f /usr/bin/git ]; then
    sudo apt-get update
    sudo apt-get install -y git tree
fi

# Install puppet.
if [ ! -f /opt/puppetlabs/bin/puppet ]; then
    # Remove puppet v3.
    sudo apt-get remove -y --purge puppet
    sudo apt-get -y autoremove

    # Install puppet v4.
    wget https://apt.puppetlabs.com/puppetlabs-release-pc1-wheezy.deb
    sudo dpkg -i puppetlabs-release-pc1-wheezy.deb
    sudo apt-get update
    sudo apt-get install -y puppet-agent
    rm puppetlabs-release-pc1-wheezy.deb
    sudo /opt/puppetlabs/bin/puppet agent --enable
fi


# Start the puppet agent.
sudo service puppet start
sudo update-rc.d puppet defaults
