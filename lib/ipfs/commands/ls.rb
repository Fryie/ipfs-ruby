require 'http_wrapper'
require 'json'
require 'ipfs/content/node'

module IPFS
  module Commands
    class LS

      def self.call(client, node)
        parse query(client, node)
      end

      private
      def self.query(client, node)
        HTTP.get("#{client.api_url}/ls?arg=#{node}&stream-channels=true").to_s
      end

      def self.parse(response)
        Content::Node.parse_array JSON.parse(response)['Objects']
      end

    end
  end
end
