#!/usr/bin/env bash

# Copy the hosts file.
sudo cp /vagrant/config/hosts/hosts.puppetmaster /etc/hosts

# Copy the .bashrc and bash_profile files.
cp /vagrant/config/bash/puppetmaster.vagrant.bashrc /home/vagrant/.bashrc
sudo cp /vagrant/config/bash/puppetmaster.root.bashrc /root/.bashrc
cp /vagrant/config/bash/puppetmaster.vagrant.bash_profile /home/vagrant/.bash_profile

# Install vim, etc.
if [ ! -f /usr/bin/vim ]; then
    sudo yum install -y vim git tree man man-pages
fi

# Install puppet.
if [ ! -f /opt/puppetlabs/bin/puppet ]; then
    sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
    sudo yum install -y puppetserver

    # Decrease puppetserver's heap size from 2g to 512mb.
    sudo cp /vagrant/config/puppet/puppetserver /etc/sysconfig/puppetserver

    # Add autosign for the agent servers.
    sudo cp /vagrant/config/puppet/autosign.conf /etc/puppetlabs/puppet/autosign.conf
fi

# Install r10k and other ruby gems.
if [ ! -f /opt/puppetlabs/puppet/bin/r10k ]; then
    sudo /opt/puppetlabs/bin/puppetserver gem install hiera-eyaml
    sudo /opt/puppetlabs/puppet/bin/gem install r10k pry hiera-eyaml
fi

# Create symlinks for puppet files.
sudo rm -rf /etc/puppetlabs/code/
sudo ln -s /vagrant/puppetmaster-server/puppetlabs/code/ /etc/puppetlabs/code
sudo rm -rf /etc/puppetlabs/puppetserver/
sudo ln -s /vagrant/puppetmaster-server/puppetlabs/puppetserver/ /etc/puppetlabs/puppetserver

# Start puppetserver.
sudo service puppetserver start
sudo chkconfig puppetserver on
