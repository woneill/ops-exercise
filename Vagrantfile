# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?('vagrant-berkshelf')
  raise 'Plugin vagrant-berkshelf is not installed!'
end

unless Vagrant.has_plugin?('vagrant-serverspec')
  raise 'Plugin vagrant-serverspec is not installed!'
end

Vagrant.configure(2) do |config|
  config.vm.box = 'bento/ubuntu-14.04'

  config.berkshelf.enabled = true

  config.vm.provision 'chef_solo' do |chef|
    # Locking down channel/version due to
    # https://github.com/chef/chef/issues/4948
    chef.channel = 'stable'
    chef.version = '12.10.24'
    chef.roles_path = 'roles'
    chef.add_role('blog')
  end

  config.vm.provision :serverspec do |spec|
    spec.pattern = '*_spec.rb'
  end
end
