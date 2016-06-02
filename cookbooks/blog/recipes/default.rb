#
# Cookbook Name:: blog
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'webserver'
include_recipe 'wordpress::app'

template "#{node['nginx']['dir']}/sites-enabled/wordpress.conf" do
  source 'nginx.conf.erb'
  variables(
    docroot          => node['wordpress']['dir'],
    server_name      => node['wordpress']['server_name'],
    server_aliases   => node['wordpress']['server_aliases'],
    server_port      => node['wordpress']['server_port']
  )
  action :create
  notifies :reload, 'service[nginx]'
end
