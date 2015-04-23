# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"

  config.vm.synced_folder ".", "/srv/choebot", type: "nfs"
  config.vm.network "private_network", ip: "192.168.50.22"

  config.vm.provision "puppet", :module_path => [ "puppet/modules" ] do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "base.pp"
    #puppet.options = "--verbose --debug"
  end
end
