require 'acceptance_helper'
require 'ipfs/content/link'

describe 'add command' do
  let(:ipfs) { ipfs_client }
  let(:node) { 'QmZyBusQkNBXUqJV6JA1bPS7QTgngGKjdBYrdPatoqtHW9' }
  let(:file) { double('myfilename.txt') }

  before do
    allow(File).to receive(:open).and_return(file)
    allow(file).to receive(:binmode)
    allow(file).to receive(:<<)
    allow(file).to receive(:rewind)
  end

  it 'issues the right API request' do
    ipfs.add 'myfilename.txt'
    expect(WebMock).to have_requested(
      :get, "#{api_url}/add?stream-channels=true"
    )
  end

  it 'returns the result' do
    result = ipfs.add 'myfilename.txt'
    expect(result.name).to eq('myfilename.txt')
    expect(result.hashcode).to eq(node)
  end
end
