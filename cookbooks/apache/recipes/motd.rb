hostname = node['hostname']
file '/etc/motd' do
	content "Workstation name, Hostname is this: #{hostname}"
end
