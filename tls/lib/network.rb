#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'socket'


module Network
	class Client
		def initialize(ip, port)
			@socket= TCPSocket.new(ip, port)
		end

		def send(data)
			@socket.puts(data)
		end

		def recv(data)
			@socket.gets(data)
		end

		def close()
			@socket.close()
		end
	end

	class Session
		def initialize(session_ctx)
			@ctx = session_ctx
		end

		def send(data)
			@ctx.puts(data)
		end

		def recv(data)
			@ctx.get(data)
		end

		def close()
			@ctx.close()
		end
	end

	class Server
		def initialize(ip, port)
			@socket = TCPServer.new(ip, port)
		end

		def accept()
			session_socket = @socket.accept()
			session = Session.new(session_socket)
			return session
		end

		def close()
			@socket.close()
		end 
	end
end