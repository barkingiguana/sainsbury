# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = 'bento/ubuntu-15.04'

  2.times do |n|
    app_box_name = 'app%0.2d' % (n + 1)
    ip = 101 + n
    config.vm.define app_box_name do |app|
      app.vm.network :private_network, ip: "10.11.12.#{ip}"
      app.vm.hostname = app_box_name
    end
  end

  config.vm.define "web" do |web|
    web.vm.network :private_network, ip: "10.11.12.10"
    web.vm.hostname = 'web'
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
