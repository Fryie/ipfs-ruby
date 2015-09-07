require 'ipfs/content/link'

module IPFS
  module Content
    class Node
      attr_reader :hashcode, :links

      def initialize(hashcode:, links:)
        @hashcode, @links = hashcode, links
      end

      def self.parse_array(array)
        array.map do |item|
          new(hashcode: item['Hash'], links: Link.parse_array(item['Links']))
        end
      end

    end
  end
end
