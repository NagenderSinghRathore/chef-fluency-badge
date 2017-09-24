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

node["apache"]["sites"].each do |sitename, data|
	document_root = "/content/sites/#{sitename}"

	directory document_root do
		mode "0755"
		recursive true
	end
	template "/etc/httpd/conf.d/#{sitename}.conf" do
	source "vhost.erb"
	mode "0644"
	variables(
		:document_root => document_root,
		:port => data["port"],
		:domain => data["domain"]
	)
	notifies :restart, "service[apache2]"
	end
	
	template "/content/sites/#{sitename}/index.html" do
		source "indextemplate.html.erb" 
		mode "0644"
		variables(
		:site_title => data["site_title"],
		:comingsoon => "Coming soon"
		)
	end
end

service "apache2" do
	service_name service
	action	[:enable, :start]
end
#include_recipe 'apache::websites'
