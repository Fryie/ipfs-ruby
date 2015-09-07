require 'http_wrapper'

module IPFS
  module Commands
    class LS

      def self.call(client, node)
        HTTP.get("#{client.api_url}/ls?arg=#{node}&stream-channels=true")
      end

    end
  end
end
