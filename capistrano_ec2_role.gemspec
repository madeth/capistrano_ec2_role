# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/ec2_role/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano_ec2_role"
  spec.version       = Capistrano::Ec2Role::VERSION
  spec.authors       = ["madeth"]
  spec.email         = ["madethg@gmail.com"]
  spec.summary       = %q{capistrano_ec2_role builds a target server from a tag of ec2 dynamically}
  spec.description   = %q{capistrano_ec2_role builds a target server from a tag of ec2 dynamically}
  spec.homepage      = "https://github.com/madeth/capistrano_ec2_role"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_dependency "aws-sdk", "~> 1.41.0"
  spec.add_dependency "capistrano", ">= 2.13.5"
end
