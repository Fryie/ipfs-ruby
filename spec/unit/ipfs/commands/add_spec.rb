require 'spec_helper'
require 'ipfs/commands/add'

module IPFS::Commands
  describe Add do
    describe '.call' do
      let(:client) { double api_url: 'api-url' }
      let(:response) { '{ "Name": "myfilename.txt", "Hash": "myhash" }' }

      before :each do
        allow(HTTP).to receive(:get) { response }
        allow(IPFS::Content::Link).to receive(:parse_single) { response }
        allow(File).to receive(:open).with('myfilename.txt', 'rb')
      end

      it 'issues the correct request' do
        Add.call(client, 'myfilename.txt')

        expect(HTTP).to have_received(:get).with(
          'api-url/add?stream-channels=true', include(:body, :headers)
        )
      end

      it 'returns the result' do
        result = JSON.parse(Add.call(client, 'myfilename.txt'))

        expect(result['Name']).to eq 'myfilename.txt'
        expect(result['Hash']).to eq 'myhash'
      end
    end
  end
end
