#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require_relative "../lib/record"
require_relative "../lib/handshake"
require_relative "../lib/tls_globals"


puts TLS::Record::ContentType.handshake
puts TLS::Record::ContentType[20]
record = TLS::Record::Record.new(version = TLS::TLS1_2)
handshake = TLS::Handshake::Handshake.new()
client_hello = TLS::Handshake::ClientHello.new()
package = record | handshake | client_hello
puts record.to_s
puts handshake.to_s
puts package.to_raw