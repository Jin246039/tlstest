#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

module TLS
  module Handshake
    class HandshakeType
      def HandshakeType.hello_request
        0
      end
  
      def HandshakeType.client_hello
        1
      end
  
      def HandshakeType.server_hello
        2
      end
  
      def HandshakeType.certificate
        11
      end
  
      def HandshakeType.server_key_exchange
        12
      end
  
      def HandshakeType.certificate_request
        13
      end
  
      def HandshakeType.server_hello_done
        14
      end
  
      def HandshakeType.certificate_verify
        15
      end
  
      def HandshakeType.client_key_exchange
        16
      end
  
      def HandshakeType.finished
        20
      end

      def HandshakeType.[](msg_type)
        handshake_msg_type = {
          0   => 'hello_request',
          1   => 'client_hello',
          2   => 'server_hello',
          11  => 'certificate',
          12  => 'server_key_exchange',
          13  => 'certificate_request',
          14  => 'server_hello_done',
          15  => 'certificate_verify',
          16  => 'client_key_exchange',
          20  => 'finished',
        }.freeze
        handshake_msg_type[msg_type]
      end
    end

    class CompressionMethod
      def CompressionMethod.null
        0
      end
    end

    class ExtensionType
      def ExtensionType.signature_algorithms
        13
      end
    end

    class HashAlgorithm
      def HashAlgorithm.none
        0
      end

      def HashAlgorithm.md5
        1
      end

      def HashAlgorithm.sha1
        2
      end

      def HashAlgorithm.sha224
        3
      end

      def HashAlgorithm.sha256
        4
      end

      def HashAlgorithm.sha384
        5
      end

      def HashAlgorithm.sha512
        6
      end
    end

    class SignatureAlgorithm

      def SignatureAlgorithm.anonymous
        0
      end

      def SignatureAlgorithm.rsa
        1
      end

      def SignatureAlgorithm.dsa
        2
      end

      def SignatureAlgorithm.ecdsa
        3
      end
    end

    class KeyExchangeAlgorithm
      def KeyExchangeAlgorithm.dhe_dss
        0
      end

      def KeyExchangeAlgorithm.dhe_rsa
        1
      end

      def KeyExchangeAlgorithm.dh_anon
        2
      end

      def KeyExchangeAlgorithm.rsa
        3
      end

      def KeyExchangeAlgorithm.dh_dss
        4
      end

      def KeyExchangeAlgorithm.dh_rsa
        5
      end
    end

    class ClientCertificateType
      def ClientCertificateType.rsa_sign
        1
      end

      def ClientCertificateType.dss_sign
        2
      end

      def ClientCertificateType.rsa_fixed
        3
      end

      def ClientCertificateType.dss_fixed
        4
      end

      def ClientCertificateType.rsa_ephemeral_dh_RESERVER
        5
      end

      def ClientCertificateType.dss_ephemeral_dh_RESERVED
        6
      end

      def ClientCertificateType.fortezza_dms_RESERVED
        20
      end
    end

    class Handshake
      attr_accessor :msg_type
      attr_accessor :length
      attr_accessor :body

      def initialize()
        @msg_type = 0
        @length = 0
        @body = ''
      end

      def show
        string = "\n\t====[ Handshake ]====\n" \
               + "\tmsg_type : #{HandshakeType[@msg_type]}\n" \
               + "\tlength   : #{@length}\n" \
               + "\tbody     : #{@body.to_s}\n"
      end

      def to_s
        @msg_type.chr + ["%06x" % @length].pack('H*') + @body.to_s
      end

      def <<(body = nil)
        @body = body
        @length = @body.chr.length
      end

      def length
        @length
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

      def show
        string_version = ProtocolVersion[@client_version]
        string = "\n\t\t====[ ClientHello ]====\n" \
               + "\t\tclient_version      : #{string_version}\n" \
               + "\t\trandom              : #{@random}\n" \
               + "\t\tsession_id          : #{@session_id}\n" \
               + "\t\tcipher_suites       : #{@cipher_suites}\n" \
               + "\t\tcompression_methods : #{@compression_methods}\n" \
      end

      def to_s
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