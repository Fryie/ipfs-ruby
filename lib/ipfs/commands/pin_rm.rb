# frozen_string_literal: true

require 'http'
require 'json'

module IPFS
  module Commands
    class PinRm
      # @return [HTTP::Response]
      def self.call(client, node, recursive:)
        HTTP.get "#{client.api_url}/pin/rm?arg=#{node}&recursive=#{recursive}"
      end
    end
  end
end
