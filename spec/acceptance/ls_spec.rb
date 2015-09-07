require 'acceptance_helper'

describe 'ls command' do

  let(:ipfs) { ipfs_client }
  let(:node) { 'QmNkJjVzQP9nzuZub4R5jPw7GrotYwKkHgEqMSUfW6jcPt' }

  it 'issues the right API request' do
    ipfs.ls node

    expect(WebMock).to have_requested(
      :get, "#{api_url}/ls?arg=#{node}&stream-channels=true"
    )
  end

  it 'parses the result' do
    result = ipfs.ls node

    expect(result.map(&:hashcode)).to eq ['Hash1', 'Hash2']
    expect(result.first.links.first.name).to eq 'Link'
    expect(result.first.links.first.hashcode).to eq 'Hash3'
    expect(result.first.links.first.size).to eq 500
  end

end
