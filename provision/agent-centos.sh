#!/usr/bin/env bash

# Copy the hosts file.
sudo cp /vagrant/config/hosts/hosts.agent-centos /etc/hosts

# Use PST instead of UTC
rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

# Copy the .bashrc files.
cp /vagrant/config/bash/agent-centos.vagrant.bashrc /home/vagrant/.bashrc
sudo cp /vagrant/config/bash/agent-centos.root.bashrc /root/.bashrc

# Install vim, etc.
if [ ! -f /usr/bin/vim ]; then
    sudo yum install -y vim git tree man man-pages
fi

# Install puppet.
if [ ! -f /opt/puppetlabs/bin/puppet ]; then
    sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
    sudo yum install -y puppet-agent

    sudo cp /vagrant/config/puppet/agent-centos-puppet.conf /etc/puppetlabs/puppet/puppet.conf
    sudo chmod 0644 /etc/puppetlabs/puppet/puppet.conf
fi

# Start the puppet agent.
sudo service puppet start
sudo chkconfig puppet on
