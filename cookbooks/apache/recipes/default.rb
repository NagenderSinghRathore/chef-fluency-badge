#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
if node['platform_family'] == "rhel"
	package = "httpd"
	service = "httpd"
elsif node['platform_family'] == "debian"
	package = "apache"
	service = "apache"
end
package 'apache2' do
	package_name package
	action :install
end

service 'apache2' do
	service_name service
	action	[:start, :enable]
end
#include_recipe 'apache::websites'
