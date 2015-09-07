# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ipfs/version'

Gem::Specification.new do |spec|
  spec.name          = "ipfs"
  spec.version       = IPFS::VERSION
  spec.authors       = ["Pierpaolo Frasa"]
  spec.email         = ["pfrasa@gmail.com"]

  spec.summary       = %q{IPFS API bindings}
  spec.description   = %q{API bindings for the Interplanetary File System}
  spec.homepage      = "https://ipfs.io"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "http", "~> 0.9.6"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "sinatra"
end
