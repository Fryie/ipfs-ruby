require 'http'
require 'http/form_data'
require 'json'
require 'ipfs/content/link'

module IPFS
  module Commands
    class Add
      def self.call(client, file)
        parse query(client, file)
      end

      private

      def self.query(client, file)
        form = multiform(file)
        HTTP.get("#{client.api_url}/add?stream-channels=true",
                 body: form.to_s,
                 headers: { 'Content-Type' => form.content_type }).to_s
      end

      def self.multiform(file)
        HTTP::FormData.create(file: HTTP::FormData::File.new(file))
      end

      def self.parse(response)
        Content::Link.parse_single JSON.parse(response)
      end
    end
  end
end
