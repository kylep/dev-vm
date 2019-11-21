# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Use Ubuntu 18.04 as the base OS
  config.vm.box = "ubuntu/bionic64"
  # Mount the cwd to /vagrant inside the VM
  config.vm.synced_folder "./", "/vagrant"
  # Set RAM, CPU, and disable log file
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
    v.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
  end
  # Set the hostname
  config.vm.define "python-dev" do |nothing|
  end
  # Run the ansible playbook to configure the VM
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/site.yml"
  end
end
