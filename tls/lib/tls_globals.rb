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
			version = @major << 8 + @minor
			case version
			when 0x0301
				"TLS v1.0"
			when 0x0302
				"TLS v1.1"
			when 0x0303
				"TLS v1.2"
			else
				"unknown"
			end
		end
	end

	TLS1_2 = ProtocolVersion.new(3, 3).freeze
	TLS1_1 = ProtocolVersion.new(3, 2).freeze
	TLS1_0 = ProtocolVersion.new(3, 1).freeze
	SSL3_0 = ProtocolVersion.new(3, 0).freeze

	def TLS.version_1_0
		TLS1_0
	end

	def TLS.version_1_1
		TLS1_1
	end

	def TLS.version_1_2
		TLS1_2
	end
end
