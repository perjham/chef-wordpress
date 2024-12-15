# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "rockylinux/9"
  #config.vm.network "forwarded_port", guest: 80, host: 8081
  config.vm.network "private_network", ip: "192.168.33.11"
  config.vm.provider "vmware_desktop" do |vb|
     vb.memory = "2048"
  end
  config.vm.provision "shell", inline: <<-SHELL
    sudo echo "Hi"
  SHELL
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "wordpress"
    chef.arguments = "--chef-license accept"
    chef.install = true
  end
end