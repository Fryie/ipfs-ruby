require 'spec_helper'
require 'ipfs/content/node'

module IPFS::Content
  describe Link do
    describe '#initialize' do
      it 'sets name, hash and size' do
        link = Link.new name: 'mylink', hashcode: 'abc', size: 300

        expect(link.name).to eq 'mylink'
        expect(link.hashcode).to eq 'abc'
        expect(link.size).to eq 300
      end
    end

    describe '.parse_single' do
      let(:single_input) do
        { 'Name' => 'link3', 'Hash' => 'hash3', 'Size' => 1800 }
      end

      let(:node) { Link.parse_single single_input }

      it 'sets the correct values on the link' do
        expect(node.name).to eq 'link3'
        expect(node.hashcode).to eq 'hash3'
        expect(node.size).to eq 1800
      end
    end

    describe '.parse_array' do
      let(:input) do
        [
          { 'Name' => 'link1', 'Hash' => 'hash1', 'Size' => 450 },
          { 'Name' => 'link2', 'Hash' => 'hash2', 'Size' => 900 }
        ]
      end
      let(:nodes) { Link.parse_array input }

      it 'creates a link for each entry' do
        expect(nodes.length).to eq 2
      end

      it 'sets the name on each link' do
        expect(nodes[0].name).to eq 'link1'
        expect(nodes[1].name).to eq 'link2'
      end

      it 'sets the hashcode on each link' do
        expect(nodes[0].hashcode).to eq 'hash1'
        expect(nodes[1].hashcode).to eq 'hash2'
      end

      it 'sets the size on each link' do
        expect(nodes[0].size).to eq 450
        expect(nodes[1].size).to eq 900
      end
    end
  end
end
