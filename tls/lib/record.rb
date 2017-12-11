#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# This file defines the record layer of the TLS protocol

module TLS
  module Record
    class ContentType
      def ContentType.change_cipher_spec
        20
      end
  
      def ContentType.alert
        21
      end
  
      def ContentType.handshake
        22
      end
  
      def ContentType.application_data
        23
      end
  
      def ContentType.heartbeat
        24
      end

      def ContentType.[](type)
        record_content_type = {
          20 => 'change_cipher_spec',
          21 => 'alert',
          22 => 'handshake',
          23 => 'application_data',
          24 => 'heartbeat',
        }.freeze
        record_content_type[type]
      end
    end

    class TLSPlaintext
      attr_accessor :type
      attr_accessor :version
      attr_accessor :length
      attr_accessor :fragment

      def initialize(options = {})
        options_default = {
          :type => 0,
          :version => 0,
          :length => 0,
          :fragment => '',
        }.freeze
        options = options.merge!(options_default)
      end

      def to_s
        string = "====[ Record ]====\n" \
               + "type    : #{ContentType[@type]}\n" \
               + "version : #{ProtocolVersion[@version]}\n" \
               + "length  : #{@length}\n" \
               + "fragment: #{@fragment.to_s}\n"
      end

      def <<(payload=nil)
        @fragment = payload
        return self
      end

      def to_raw
        bytes = "\xaa\xaa" + @fragment.to_raw
      end
    end
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
  end
end