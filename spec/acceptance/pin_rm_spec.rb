# frozen_string_literal: true

require 'acceptance_helper'

describe 'pin rm command' do
  let(:ipfs)          { ipfs_client }
  let(:node)          { 'QmPokKskGJwH5XPX3jzEmKX365HnzED3n7x56v2jaNX5Lf' }
  let(:response_hash) { { 'Pins' => [node] } }

  describe 'Api syntax' do
    it 'Without recursive' do
      ipfs.pin_rm node

      expect(WebMock).to have_requested :get, "#{api_url}/pin/rm?arg=#{node}&recursive=true"
    end

    it 'With positive recursive' do
      ipfs.pin_rm node, recursive: true

      expect(WebMock).to have_requested :get, "#{api_url}/pin/rm?arg=#{node}&recursive=true"
    end

    it 'With negative recursive' do
      ipfs.pin_rm node, recursive: false

      expect(WebMock).to have_requested :get, "#{api_url}/pin/rm?arg=#{node}&recursive=false"
    end
  end

  it 'Main case' do
    result = ipfs.pin_rm node

    expect(result).to be_a HTTP::Response
    expect(result.code).to eq 200
    expect(JSON.parse result.to_s).to eq response_hash
  end
end
