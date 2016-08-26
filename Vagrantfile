# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "puppetmaster" do |master|
    master.vm.box = "bento/centos-6.7"
    master.vm.box_version = "2.2.7"

    master.vm.network :private_network, ip: "192.168.37.11"
    master.vm.network :forwarded_port, guest: 22, host: 4597, auto_correct: true

    master.vm.provision :shell, path: "./provision/puppetmaster.sh", privileged: false
    master.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=777,fmode=777"]
    master.vm.hostname = "master.puppet-modules.loc"

    master.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end

  config.vm.define "agent-centos" do |centos|
    centos.vm.box = "bento/centos-6.7"
    centos.vm.box_version = "2.2.7"

    centos.vm.network :private_network, ip: "192.168.37.12"
    centos.vm.network :forwarded_port, guest: 22, host: 4598, auto_correct: true

    centos.vm.provision :shell, path: "./provision/agent-centos.sh", privileged: false
    centos.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=777,fmode=777"]
    centos.vm.hostname = "centos.puppet-modules.loc"

    centos.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end

  config.vm.define "agent-ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/trusty64"
    ubuntu.vm.box_version = "20160208.0.0"

    ubuntu.vm.network :private_network, ip: "192.168.37.13"
    ubuntu.vm.network :forwarded_port, guest: 22, host: 4599, auto_correct: true

    ubuntu.vm.provision :shell, path: "./provision/agent-ubuntu.sh", privileged: false
    ubuntu.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=777,fmode=777"]
    ubuntu.vm.hostname = "ubuntu.puppet-modules.loc"

    ubuntu.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
  end
end
