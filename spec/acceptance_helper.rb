require 'spec_helper'
require 'webmock/rspec'
require 'ipfs/client'

RSpec.configure do |config|
  config.before :all do
    WebMock.disable_net_connect!
    stub_request :any, api_url
  end
end

def ipfs_client
  IPFS::Client.new host: default_host, port: default_port
end

def default_host
  'http://myhost.com'
end

def default_port
  6035
end

def api_url
  "#{default_host}:#{default_port}/api/v0"
end
