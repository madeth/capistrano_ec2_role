require 'capistrano/version'
require "capistrano/ec2_role"

if defined?(Capistrano::VERSION) && Gem::Version.new(Capistrano::VERSION) >= Gem::Version.new('3.0.0')
  extend Capistrano::Ec2Role::DSL::Env
else
  require 'capistrano/ec2_role/configuration'
end
