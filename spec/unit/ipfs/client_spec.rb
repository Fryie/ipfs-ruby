require 'spec_helper'
require 'ipfs/client'

module IPFS
  describe Client do
    let(:client) { Client.default }

    describe '.default' do
      it 'creates client with default host and port' do
        client = Client.default

        expect(client.host).to eq Client::DEFAULT_HOST
        expect(client.port).to eq Client::DEFAULT_PORT
      end
    end

    describe '#initialize' do
      it 'allows to set the host and port' do
        client = Client.new host: 'myhost', port: 3001

        expect(client.host).to eq 'myhost'
        expect(client.port).to eq 3001
      end
    end

    describe '#api_url' do
      it 'is built out of host, port and prefix' do
        client = Client.new host: 'myhost', port: 8077
        expect(client.api_url).to eq(
          "myhost:8077/api/#{Client::API_VERSION}"
        )
      end
    end

    describe '#ls' do
      it 'delegates to LS class' do
        allow(Commands::LS).to receive(:call)
        node = 'abc'

        client.ls node

        expect(Commands::LS).to have_received(:call).with client, node
      end
    end

    describe '#cat' do
      it 'delegates to Cat class' do
        allow(Commands::Cat).to receive(:call)
        node = 'abc'

        client.cat node

        expect(Commands::Cat).to have_received(:call).with client, node
      end
    end
  end

end
