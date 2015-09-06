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

end
