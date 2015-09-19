require 'spec_helper'
require 'ipfs/commands/cat'

module IPFS::Commands
  describe Cat do
    describe '.call' do
      let(:client) { double api_url: 'api-url' }
      let(:response) { double to_s: 'response' }
      let(:node) { 'abc' }

      before :each do
        allow(HTTP).to receive(:get) { response }
      end

      it 'issues the correct request' do
        Cat.call client, node

        expect(HTTP).to have_received(:get).with(
          "api-url/cat?arg=abc&stream-channels=true"
        )
      end

      it 'returns the result' do
        result = Cat.call client, node
        expect(result).to eq 'response'
      end

    end
  end
end
