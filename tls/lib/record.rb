#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# This file defines the record layer of the TLS protocol

module TLS
	module Record
		class GenericStreamCipher
			attr_accessor :content
			attr_accessor :MAC
		end

		class GenericBlockCipher
			attr_accessor :IV
			attr_accessor :block_ciphered
		end

		class GenericAEADCipher
			attr_accessor :nonce_explicit
			attr_accessor :aead_ciphered
		end

		ContentType = {
			'change_cipher_spec' => 20,
			'alert'              => 21,
			'handshake'          => 22,
			'application_data'   => 23,
			'heartbeat'          => 24,
		}.freeze

		class Record
			attr_accessor :type
			attr_accessor :version
			attr_accessor :length
			attr_accessor :fragment

			def initialize(version = 0)
				@type = 0
				@version = version
				@length = 0
				@fragment = ''
			end

			def to_s
				string = "====[ Record ]====\n" \
					   + "type    : #{@type}\n" \
					   + "version : #{@version.to_s}\n" \
					   + "length  : #{@length}"
			end

			def |(payload=nil)
				@fragment = payload
				return self
			end

			def to_raw
				puts "in Record to_raw"
				bytes = "\xaa\xaa" + @fragment.to_raw
			end
		end
	end		
end