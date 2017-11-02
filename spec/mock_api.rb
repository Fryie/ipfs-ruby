require 'sinatra/base'
require 'json'

class MockAPI < Sinatra::Base
  get '/api/v0/ls' do
    content_type :json

    {
      Objects: [
        {
          Hash: 'Hash1',
          Links: [{
            Name: 'Link',
            Hash: 'Hash3',
            Size: 500
          }]
        },
        {
          Hash: 'Hash2',
          Links: []
        }
      ]
    }.to_json
  end

  get '/api/v0/cat' do
    'This is just some text.'
  end

  get '/api/v0/add' do
    content_type :json

    {
      Name: 'myfilename.txt',
      Bytes: 1234,
      Hash: 'QmZyBusQkNBXUqJV6JA1bPS7QTgngGKjdBYrdPatoqtHW9'
    }.to_json
  end
end
