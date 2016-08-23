#!/usr/bin/env bash

# Copy the hosts file.
sudo cp /vagrant/config/hosts/hosts.puppetmaster /etc/hosts

# Copy the .bashrc and bash_profile files.
cp /vagrant/config/bash/puppetmaster.vagrant.bashrc /home/vagrant/.bashrc
sudo cp /vagrant/config/bash/puppetmaster.root.bashrc /root/.bashrc
cp /vagrant/config/bash/puppetmaster.vagrant.bash_profile /home/vagrant/.bash_profile

# Install vim, etc.
if [ ! -f /usr/bin/vim ]; then
    sudo yum install -y vim git
fi

# Install puppet.
if [ ! -f /opt/puppetlabs/bin/puppet ]; then
    sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
    sudo yum install -y puppetserver

    # Decrease puppetserver's heap size from 2g to 512mb.
    sudo cp /vagrant/config/puppet/puppetserver /etc/sysconfig/puppetserver

    # Start puppetserver.
    sudo service puppetserver start
    sudo chkconfig puppetserver on
fi

# Install r10k.
if [ ! -f /opt/puppetlabs/puppet/bin/r10k ]; then
    /opt/puppetlabs/puppet/bin/gem install r10k
fi
