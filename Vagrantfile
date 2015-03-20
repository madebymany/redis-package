# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # network using the host's network device. This makes the VM appear as another
  config.vm.define :trusty64 do |precise64|
    precise64.vbguest.auto_update = false
    precise64.vm.box = "ubuntu/trusty64"
    precise64.vm.network "public_network", :bridge => 'en0: Wi-Fi (AirPort)'
    precise64.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1028]
    end
  end
end
