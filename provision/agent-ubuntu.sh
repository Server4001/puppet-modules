#!/usr/bin/env bash

# Copy the hosts file.
sudo cp /vagrant/config/hosts/hosts.agent-ubuntu /etc/hosts

# Use PST instead of UTC
rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

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

    sudo cp /vagrant/config/puppet/agent-ubuntu-puppet.conf /etc/puppetlabs/puppet/puppet.conf
    sudo chmod 0644 /etc/puppetlabs/puppet/puppet.conf

    sudo /opt/puppetlabs/bin/puppet agent --enable
fi


# Start the puppet agent.
sudo service puppet start
sudo update-rc.d puppet defaults
