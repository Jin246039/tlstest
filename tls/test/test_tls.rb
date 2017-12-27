#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require_relative "../lib/record"
require_relative "../lib/handshake"
require_relative "../lib/tls_globals"


puts TLS::Record::ContentType.handshake
puts TLS::Record::ContentType[20]
record = TLS::Record::Record.new() \
						<< TLS::Handshake::Handshake.new()
puts record.class
puts TLS::Handshake::Handshake.new().class
