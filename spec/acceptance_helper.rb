require 'spec_helper'
require 'webmock/rspec'
require 'mock_api'
require 'ipfs/client'

RSpec.configure do |config|
  config.before :each do
    WebMock.disable_net_connect!
    stub_request(:any, /#{Regexp.escape(api_url)}/).to_rack MockAPI
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
