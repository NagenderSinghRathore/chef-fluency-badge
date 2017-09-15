file 'default www' do
	path '/var/www/html/index.html'
	content 'Hello Worlddddd!'
end
#as this is (index.html) not a server side file and will not require restarting apache service, there is no need to restart this service other we would have done it using ‘notifies’ property
