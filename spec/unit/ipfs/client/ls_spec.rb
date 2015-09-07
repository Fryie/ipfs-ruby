require 'spec_helper'
require 'ipfs/commands/ls'

module IPFS::Commands
  describe LS do
    describe '.call' do
      let(:client) { double api_url: 'api-url' }
      let(:node) { 'abc' }

      before :each do
        allow(HTTP).to receive(:get)
      end

      it 'issues the correct request' do
        LS.call client, node

        expect(HTTP).to have_received(:get).with(
          "api-url/ls?arg=abc&stream-channels=true"
        )
      end
    end
  end
end
