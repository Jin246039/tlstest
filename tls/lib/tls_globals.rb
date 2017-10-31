#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
module TLS
	class ProtocolVersion
		attr_accessor :major
		attr_accessor :minor

		def initialize(major_version, minor_version)
			@major = major_version
			@minor = minor_version
		end

		def to_s
			"TLS v1.2"
		end
	end

	TLS1_2 = ProtocolVersion.new(3, 3).freeze
	TLS1_1 = ProtocolVersion.new(3, 2).freeze
	TLS1_0 = ProtocolVersion.new(3, 1).freeze
	SSL3_0 = ProtocolVersion.new(3, 0).freeze
end
