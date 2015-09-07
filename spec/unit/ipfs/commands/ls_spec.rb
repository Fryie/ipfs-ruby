require 'spec_helper'
require 'ipfs/commands/ls'

module IPFS::Commands
  describe LS do
    describe '.call' do
      let(:client) { double api_url: 'api-url' }
      let(:response) { double to_s: '{ "Objects": [1, 2] }' }
      let(:node) { 'abc' }

      before :each do
        allow(HTTP).to receive(:get) { response }
        allow(IPFS::Content::Node).to receive(:parse_array) { 'result' }
      end

      it 'issues the correct request' do
        LS.call client, node

        expect(HTTP).to have_received(:get).with(
          "api-url/ls?arg=abc&stream-channels=true"
        )
      end

      it 'extracts the objects and forwards to Content::Node' do
        LS.call client, node

        expect(IPFS::Content::Node).to have_received(:parse_array).with [1, 2]
      end

      it 'returns the result' do
        expect(LS.call(client, node)).to eq 'result'
      end
    end
  end
end
