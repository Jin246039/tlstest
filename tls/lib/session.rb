#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

module TLS
	module Record
		ConnectionEnd = {
			'server' => 0,
			'client' => 1,
		}.freeze

		PRFAlgorithm = {
			'tls_prf_sha256' => 0,
		}.freeze

		BulkCipherAlgorithm = {
			'null'  => 0,
			'rc4'   => 1,
			'3des'  => 2,
			'aes'   => 3,
		}.freeze

		CipherType = {
			'stream' => 0,
			'block'  => 1,
			'aead'   => 2,
		}.freeze

		MACAlgorithm = {
			'null' => 0,
			'hmac_md5' => 1,
			'hmac_sha1' => 2,
			'hmac_sha256' => 3,
			'hmac_sha384' => 4,
			'hamc_sha512' => 5
		}.freeze

		CompressionMethod = {
			'null' => 0,
		}.freeze

		class SecurityParameters
			attr_accessor :entity
			attr_accessor :prf_algorithm
			attr_accessor :bulk_cipher_algorithm
			attr_accessor :cipher_type
			attr_accessor :enc_key_length
			attr_accessor :block_length
			attr_accessor :fixed_iv_length
			attr_accessor :record_iv_length
			attr_accessor :mac_algotithm
			attr_accessor :mac_length
			attr_accessor :mac_key_length
			attr_accessor :compression_algorithm
			attr_accessor :master_secret
			attr_accessor :client_random
			attr_accessor :server_random
		end

		class TLS
			def initialize
				return 0
			end

			def set
				return 0
			end

			def get
				return 0
			end

			def handshake
			end
		end

		class Network
		end
	end
end