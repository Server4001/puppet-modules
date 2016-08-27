#!/usr/bin/env bash

# Creating the eyaml keys used for encrypting/decrypting Hiera values:
cd /vagrant/config/puppet/
eyaml createkeys
# Creates:
# ./keys/
# ./keys/private_key.pkcs7.pem
# ./keys/public_key.pkcs7.pem

sudo mkdir -p /etc/puppetlabs/keys
sudo cp /vagrant/config/puppet/keys/*.pem /etc/puppetlabs/keys/
sudo chown puppet: /etc/puppetlabs/keys/*.pem
sudo service puppetserver restart
