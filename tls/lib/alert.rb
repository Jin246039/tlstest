#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

module TLS
	module Handshake
		AlertLevel = {
			'warning' => 1,
			'fatal'   => 2,
		}.freeze

		AlertDescription = {
			'close_notify' => 0,
			'unexpected_message' => 10,
			'bad_record_mac' => 20,
			'decrypted_failed_RESERVED' => 21,
			'record_overflow' => 22,
			'decompression_failure' => 30,
			'handshake_failure' => 40,
			'no_certificate_RESERVED' => 41,
			'bad_certificate' => 42,
			'unsupported_certificate' => 43,
			'certificate_revoked' => 44,
			'certificate_expired' => 45,
			'certificate_unknown' => 46,
			'illegal_parameter' => 47,
			'unknown_ca' => 48,
			'access_denied' => 49,
			'decode_error' => 50,
			'decrypt_error' => 51,
			'export_restriction_RESERVED' => 60,
			'protocol_version' => 70,
			'insufficient_security' => 71,
			'internal_error' => 80,
			'user_canceled' => 90,
			'no_renegotiation' => 100,
			'unsupported_extension' => 110,
		}.freeze

		class Alert
			attr_accessor :level
			attr_accessor :description

			def initialize(level, description)
				@level = level
				@description = description
			end
			
			def to_s
				string = "\t====[ Alert ]====\n" \
					   + "\tlevel: #{@level}\n" \
					   + "\tdescript: #{@description}"
			end

			def to_raw
				bytes = "\x01\x00"
			end
		end
	end
end