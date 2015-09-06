module IPFS
  class Client
    DEFAULT_HOST = 'localhost'
    DEFAULT_PORT = 5001

    attr_reader :host, :port

    def self.default
      new(host: DEFAULT_HOST, port: DEFAULT_PORT)
    end

    def initialize(host:, port:)
      @host, @port = host, port
    end

    def ls(node)
      LS.call node
    end

  end
end
