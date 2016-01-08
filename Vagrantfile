# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
def configure_with_chef config
  config.vm.provision :chef_zero do |chef|
    chef.cookbooks_path = 'berks-cookbooks'
    chef.roles_path = 'roles'
    chef.nodes_path = 'nodes'
    yield chef if block_given?
  end
end

Vagrant.configure(2) do |config|
  config.vm.box = 'bento/ubuntu-15.04'
  config.berkshelf.enabled = false

  2.times do |n|
    app_box_name = 'app%0.2d' % (n + 1)
    ip = 101 + n
    config.vm.define app_box_name do |app|
      app.vm.network :private_network, ip: "10.11.12.#{ip}"
      app.vm.hostname = app_box_name
      configure_with_chef app do |chef|
        chef.add_role 'app'
      end
    end
  end

  config.vm.define "web" do |web|
    web.vm.network :private_network, ip: "10.11.12.10"
    web.vm.hostname = 'web'
    configure_with_chef web do |chef|
      chef.add_role 'web'
    end
    web.vm.network :forwarded_port, guest: 80, host: 8282
  end
end
