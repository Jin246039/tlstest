#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# This file defines the record layer of the TLS protocol
require_relative "change_cipher_spec"
require_relative "alert"
require_relative "application_data"

module TLS
  module Record
    include TLS::Handshake

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

        @type = options[:type]
        @version = options[:version]
        @length = options[:length]
        @fragment = options[:fragment]
      end

      def show
        string = "====[ Record ]====\n" \
               + "type    : #{ContentType[@type]}\n" \
               + "version : #{ProtocolVersion[@version]}\n" \
               + "length  : #{@length}\n" \
               + "fragment: #{@fragment.show}\n"
      end

      def <<(fragment = nil)
        if fragment.instance_of?(Handshake::ChangeCipherSpec)
          @type = ContentType.change_cipher_spec
          @fragment = fragment
        elsif fragment.instance_of?(Handshake::Alert)
          @type = ContentType.alert
          @fragment = fragment
        elsif fragment.instance_of?(Handshake::Handshake)
          @type = ContentType.handshake
          @fragment = fragment
        elsif fragment.instance_of?(Handshake::ApplicationData)
          @type = ContentType.application_data
          @fragment = fragment
        elsif @fragment == ''
          @fragment = fragment
        else
          @fragment << fragment
        end

        @length = @fragment.length
      end

      def to_s
        raw = @type.chr + @version.to_s
        raw += ["%04x" % @length].pack('H*') + @fragment.to_s
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