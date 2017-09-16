hostname = node['hostname']
file '/etc/motd' do
	content "This is a chef-node, Hostname is this: #{hostname}"
end
