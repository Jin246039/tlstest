#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require_relative "../lib/record"
require_relative "../lib/handshake"
require_relative "../lib/tls_globals"


puts TLS::Record::ContentType.handshake
puts TLS::Record::ContentType[20]
record = TLS::Record::TLSPlaintext.new(:version => TLS::ProtocolVersion.version_1_1)
handshake = TLS::Handshake::Handshake.new()
client_hello = TLS::Handshake::ClientHello.new()
package = record << handshake << client_hello
puts record.to_s