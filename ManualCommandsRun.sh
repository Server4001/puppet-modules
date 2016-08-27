#!/usr/bin/env bash

# Creating the eyaml keys used for encrypting/decrypting Hiera values:
cd /vagrant/config/puppet/
eyaml createkeys
# Creates:
# ./keys/
# ./keys/private_key.pkcs7.pem
# ./keys/public_key.pkcs7.pem

sudo su
mkdir -p /etc/puppetlabs/keys
cp /vagrant/config/puppet/keys/*.pem /etc/puppetlabs/keys/
chown -R puppet: /etc/puppetlabs/keys/
chmod -R 0700 /etc/puppetlabs/keys/
chmod 0400 /etc/puppetlabs/keys/*.pem
exit

sudo service puppetserver restart
