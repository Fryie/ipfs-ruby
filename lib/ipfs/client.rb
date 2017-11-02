require 'ipfs/commands/ls'
require 'ipfs/commands/cat'
require 'ipfs/commands/add'

module IPFS
  class Client
    DEFAULT_HOST = 'http://localhost'.freeze
    DEFAULT_PORT = 5001
    API_VERSION = 'v0'.freeze

    attr_reader :host, :port

    def self.default
      new(host: DEFAULT_HOST, port: DEFAULT_PORT)
    end

    def initialize(host:, port:)
      @host = host
      @port = port
    end

    def api_url
      "#{host}:#{port}/api/#{API_VERSION}"
    end

    def ls(node)
      Commands::LS.call self, node
    end

    def cat(node)
      Commands::Cat.call self, node
    end

    def add(file)
      Commands::Add.call self, file
    end
  end
end
