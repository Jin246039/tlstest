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
			version = (@major << 8) + @minor
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

		def ProtocolVersion.[](version)
			case version
			when 0x0301
				"TLS v1.0"
			when 0x0302
				"TLS v1.1"
			when 0x0303
				"TLS V1.2"
			else
				"#{version} (unknown)"
			end
		end
	
		def ProtocolVersion.version_1_0
			0x0301
		end
	
		def ProtocolVersion.version_1_1
			0x0302
		end
	
		def ProtocolVersion.version_1_2
			0x0303
		end
	end
end
