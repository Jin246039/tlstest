#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

module TLS
	module Handshake
		HandshakeType = {
			'hello_request' => 0,
			'client_hello' => 1,
			'server_hello' => 2,
			'certificate' => 11,
			'server_key_exchange' => 12,
			'certificate_request' => 13,
			'server_hello_done' => 14,
			'certificate_verify' => 15,
			'client_key_exchange' => 16,
			'finished' => 20,
		}

		CompressionMethod = {
			'null' => 0,
		}

		ExtensionType = {
			'signature_algorithms' => 13,
		}

		HashAlgorithm = {
			'none' => 0,
			'md5' => 1,
			'sha1' => 2,
			'sha224' => 3,
			'sha256' => 4,
			'sha384' => 5,
			'sha512' => 6,
		}

		SignatureAlgorithm = {
			'anonymous' => 0,
			'rsa' => 1,
			'dsa' => 2,
			'ecdsa' => 3,
		}

		KeyExchangeAlgorithm = {
			'dhe_dss' => 0,
			'dhe_rsa' => 1,
			'dh_anon' => 2,
			'rsa' => 3,
			'dh_dss' => 4,
			'dh_rsa' => 5,
		}

		ClientCertificateType = {
			'rsa_sign' => 1,
			'dss_sign' => 2,
			'rsa_fixed' => 3,
			'dss_fixed' => 4,
			'rsa_ephemeral_dh_RESERVER' => 5,
			'dss_ephemeral_dh_RESERVED' => 6,
			'fortezza_dms_RESERVED' => 20
		}

		class Handshake
			attr_accessor :msg_type
			attr_accessor :length
			attr_accessor :body

			def initialize()
				@msg_type = nil
				@length = nil
				@body = nil
			end

			def to_s
				string = "\t====[ Handshake ]====\n" \
					     + "\tmsg_type : #{@msg_type}\n" \
					     + "\tlength   : #{@length}"
			end

			def to_raw
				"\xbb\xbb\xbb" + @body.to_raw
			end

			def |(body = nil)
				@body = body
				return self
			end
		end

		class Random
			attr_accessor :gmt_unix_time
			attr_accessor :random_bytes
		end

		class ClientHello
			attr_accessor :client_version
			attr_accessor :random
			attr_accessor :session_id
			attr_accessor :cipher_suites
			attr_accessor :compression_methods
			attr_accessor :extensions_present
			attr_accessor :extensions

			def initialize
				@client_version = 0
			end

			def to_raw
				data = "\xcc\xcc"
			end
		end

		class ServerHello
			attr_accessor :server_version
			attr_accessor :random
			attr_accessor :session_id
			attr_accessor :cipher_suite
			attr_accessor :compression_method
			attr_accessor :extensions_present
			attr_accessor :extensions
		end

		class SignatureAndHashAlgorithm
			attr_accessor :Hash
			attr_accessor :signature
		end

		class Certificate
			attr_accessor :certificate_list
		end

		class ServerDHParams
			attr_accessor :dh_p
			attr_accessor :dh_g
			attr_accessor :dh_Ys
		end

		class ServerKeyExchange
			attr_accessor :params
		end

		class CertificateRequest
			attr_accessor :certificate_types
			attr_accessor :supported_signature_algorithms
			attr_accessor :certificate_authorities
		end

		class ClientKeyExchange
			attr_accessor :exchange_keys
		end

		class Finished
			attr_accessor :verify_data
		end
	end
end