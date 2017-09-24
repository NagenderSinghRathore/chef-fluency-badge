file 'default www' do
	path '/var/www/html/index.html'
	content 'Hello Worlddddd!'
end
#as this is (index.html) not a server side file and will not require restarting apache service, there is no need to restart this service other we would have done it using ‘notifies’ property
webnodes = search('node','role:web') # This command will search through all nodes and fetch the nodes which have role web
#Loop through each node stored in variable webnodes
webnodes.each do |node|
	puts node
end
