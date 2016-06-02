#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'hhvm'

service 'hhvm' do
  supports status => true
  action [:enable, :start]
end

# Taken from hhvm3 cookbook
php_replaced = "#{Chef::Config[:file_cache_path]}/php_replaced"
execute 'replace php' do
  # rubocop:disable Metrics/LineLength
  command '/usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60'
  not_if do
    ::File.exist?(php_replaced)
  end
end

file php_replaced do
  owner 'root'
  group 'root'
  mode '0644'
  action :create_if_missing
end

package 'curl'
include_recipe 'nginx'

if node['testing']
  cookbook_file "#{node['nginx']['dir']}/sites-available/testing" do
    source 'site-testing'
    mode 0644
    owner node['nginx']['user']
    group node['nginx']['user']
  end

  nginx_site 'testing'

  directory '/var/www/testing' do
    owner node['nginx']['user']
    group node['nginx']['user']
    mode '0755'
    recursive true
    action :create
  end

  cookbook_file '/var/www/testing/info.php' do
    source 'info.php'
    owner node['nginx']['user']
    group node['nginx']['user']
    mode '0755'
    action :create_if_missing
  end
else
  nginx_site 'testing' do
    enable false
  end

  directory '/var/www/testing' do
    recursive true
    action :delete
  end

  cookbook_file "#{node['nginx']['dir']}/sites-available/testing" do
    action :delete
  end
end
