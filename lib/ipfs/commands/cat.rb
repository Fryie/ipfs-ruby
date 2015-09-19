require 'http'

module IPFS
  module Commands
    class Cat
      def self.call(client, node)
        HTTP.get("#{client.api_url}/cat?arg=#{node}&stream-channels=true").to_s
      end
    end
  end
end
