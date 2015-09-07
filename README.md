# IPFS API Bindings for Ruby
This gem provides IPFS API bindings for Ruby, see [https://ipfs.io](https://ipfs.io).

Work in progress.

## Installation

(The following doesn't work yet, the gem is not yet released on Rubygems.)

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
client.ls node # => issues an API ls request, but does not return a result yet
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/Fryie/ipfs).
