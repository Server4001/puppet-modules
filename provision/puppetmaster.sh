#!/usr/bin/env bash

# Copy the hosts file.
cp /vagrant/config/hosts/hosts.puppetmaster /etc/hosts

# Copy the .bashrc and bash_profile files.
cp /vagrant/config/bash/puppetmaster.vagrant.bashrc /home/vagrant/.bashrc
chown vagrant: /home/vagrant/.bashrc
cp /vagrant/config/bash/puppetmaster.root.bashrc /root/.bashrc
cp /vagrant/config/bash/puppetmaster.vagrant.bash_profile /home/vagrant/.bash_profile
chown vagrant: /home/vagrant/.bash_profile

# Install vim, etc.
if [ ! -f /usr/bin/vim ]; then
    yum install -y vim git tree man man-pages
fi

# Install gcc, etc.
if [ ! -f /usr/bin/gcc ]; then
    yum install -y gcc gcc-c++ autoconf automake
fi

# Install puppet.
if [ ! -f /opt/puppetlabs/bin/puppet ]; then
    rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
    yum install -y puppetserver

    # Decrease puppetserver's heap size from 2g to 512mb.
    cp /vagrant/config/puppet/puppetserver /etc/sysconfig/puppetserver

    # Add autosign for the agent servers.
    cp /vagrant/config/puppet/autosign.conf /etc/puppetlabs/puppet/autosign.conf
    chmod 0644 /etc/puppetlabs/puppet/autosign.conf

    # Add keys for eyaml and hiera.
    mkdir -p /etc/puppetlabs/keys
    cp /vagrant/config/puppet/keys/*.pem /etc/puppetlabs/keys/
    chown -R puppet: /etc/puppetlabs/keys/
    chmod -R 0700 /etc/puppetlabs/keys/
    chmod 0400 /etc/puppetlabs/keys/*.pem
fi

# Install r10k and other ruby gems.
if [ ! -f /opt/puppetlabs/puppet/bin/r10k ]; then
    /opt/puppetlabs/bin/puppetserver gem install hiera-eyaml
    /opt/puppetlabs/puppet/bin/gem install r10k pry hiera-eyaml bundler
fi

# Create symlinks for puppet files.
rm -rf /etc/puppetlabs/code/
ln -s /vagrant/puppetmaster-server/puppetlabs/code/ /etc/puppetlabs/code
rm -rf /etc/puppetlabs/puppetserver/
ln -s /vagrant/puppetmaster-server/puppetlabs/puppetserver/ /etc/puppetlabs/puppetserver

# Start puppetserver.
service puppetserver start
chkconfig puppetserver on
