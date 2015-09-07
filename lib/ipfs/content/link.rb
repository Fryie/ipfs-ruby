module IPFS
  module Content
    class Link
      attr_reader :name, :hashcode, :size

      def initialize(name:, hashcode:, size:)
        @name, @hashcode, @size = name, hashcode, size
      end

      def self.parse_array(array)
        array.map do |item|
          new name: item['Name'], hashcode: item['Hash'], size: item['Size']
        end
      end
    end
  end
end
