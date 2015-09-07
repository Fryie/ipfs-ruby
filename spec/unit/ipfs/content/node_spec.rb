require 'spec_helper'
require 'ipfs/content/node'

module IPFS::Content
  describe Node do

    describe '#initialize' do
      it 'sets the hash and the array of links' do
        node = Node.new hashcode: 'abc', links: [1, 2]

        expect(node.hashcode).to eq 'abc'
        expect(node.links).to eq [1, 2]
      end
    end

    describe '.parse_array' do
      let(:input) do
        [
          { 'Hash' => 'abc', 'Links' => ['1', '2'] },
          { 'Hash' => 'def', 'Links' => ['3', '4'] }
        ]
      end

      let(:nodes) { Node.parse_array input }

      before :each do
        allow(Link).to receive(:parse_array) { [1, 2] }
      end

      it 'creates a node for each entry' do
        expect(nodes.length).to eq 2
      end

      it 'sets the hashcode on each entry' do
        expect(nodes[0].hashcode).to eq 'abc'
        expect(nodes[1].hashcode).to eq 'def'
      end

      it 'parses the links' do
        nodes

        expect(Link).to have_received(:parse_array).with ['1', '2']
        expect(Link).to have_received(:parse_array).with ['3', '4']
      end

      it 'sets the links' do
        expect(nodes[0].links).to eq [1, 2]
        expect(nodes[1].links).to eq [1, 2]
      end

    end

  end
end
