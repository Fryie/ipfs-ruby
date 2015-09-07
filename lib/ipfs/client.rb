require 'ipfs/commands/ls'

module IPFS
  class Client
    DEFAULT_HOST = 'http://localhost'
    DEFAULT_PORT = 5001
    API_VERSION = 'v0'

    attr_reader :host, :port

    def self.default
      new(host: DEFAULT_HOST, port: DEFAULT_PORT)
    end

    def initialize(host:, port:)
      @host, @port = host, port
    end

    def api_url
      "#{host}:#{port}/api/#{API_VERSION}"
    end

    def ls(node)
      Commands::LS.call self, node
    end
  end
end
