require 'socket'
require 'json'

server = TCPServer.open(2000)

loop do
	Thread.start(server.accept) do |client|

		request = client.read_nonblock(256)
		request_header, request_body = request.split("\r\n\r\n", 2)

		puts request_header
		puts request_body

		request_type = request_header.split[0]
		file_name = request_header.split[1]

		if File.exist?(file_name)
			response_body = File.read(file_name)
			client.print "HTTP/1.1 200 OK\r\n#{Time.now}\r\nContent-Type:text/html\r\nContent-Length: #{response_body.length}\r\n\r\n"
			if request_type == 'GET'
				client.print response_body
				client.print "\r\n\r\n"
			elsif request_type == 'POST'
				params = JSON.parse(request_body)
				viking_info = "<li>Name: #{params['viking']['name']}</li><li>e-mail: #{params['viking']['email']}</li>"
				client.print response_body.gsub("<%= yield %>", viking_info)
			else
				client.puts "Unknown request error"
			end
		else
			client.puts "HTTP/1.0 404 Not Found\r\n#{Time.now.ctime}\r\n\r\n"
			client.puts "404 Error, Your File has Disappeared"
		end
		client.close

	end
end