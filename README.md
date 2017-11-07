# IPFS API Bindings for Ruby

![](https://ipfs.io/ipfs/QmQJ68PFMDdAsgCZvA1UVzzn18asVcf7HVvCDgpjiSCAse)

> This gem provides IPFS API bindings for Ruby, see [https://ipfs.io](https://ipfs.io).

**Work in progress.**

## Installation
Requires Ruby >= 2.1, since it uses the new required keyword arguments syntax.

Add this line to your application's Gemfile:

```ruby
gem 'ipfs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ipfs

## Usage
### Initialize client

```ruby
require 'ipfs/client'
client = IPFS::Client.new host: 'yourhost', port: 5001
```

or:

```ruby
require 'ipfs/client'
client = IPFS::Client.default # => uses localhost and port 5001
```

### ls

```ruby
nodes = client.ls 'QmXqJAkSdP8e7TSXEeSRKoDY27G11ZwaFJGiKuNFWxpUZo'

nodes.each do |node|
  # node is an instance of IPFS::Content::Node

  puts node.hashcode

  node.links.each do |link|
    # link is an instance of IPFS::Content::Link

    puts link.name
    puts link.hashcode
    puts link.size
  end
end
```

### add
```ruby
link = client.add 'myExampleFile.txt'
puts link.hashcode
# => QmaVwjMgqjBD25apiuVVnaDqU8SsiiREAAy3Amb1Bs2XHs
```

### cat
```ruby
client.cat 'QmaVwjMgqjBD25apiuVVnaDqU8SsiiREAAy3Amb1Bs2XHs'
# => "This is some example content."
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/Fryie/ipfs-ruby).
