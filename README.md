# capistrano_ec2_role

Capistrano plugin for ec2

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano_ec2_role', require: false

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano_ec2_role

## Usage

need set ec2 tags on AWS

![ec2_tag](https://raw.githubusercontent.com/wiki/madeth/capistrano_ec2_role/images/ec2_tag.png)

### Capistrano3

```
# Capfile
require 'capistrano_ec2_role'
```

```
# config/deploy.rb
set :ec2_deploy_tag_name, 'role' # default is 'role'
set :aws_access_key_id, '...'
set :aws_secret_access_key, '...'
set :aws_region, '...'
```

```
# config/deploy/*.rb
ec2_role :web, 'web'
ec2_role :app, 'app'
ec2_role :db, 'db'
```

### Capistrano2

```
# config/deploy.rb
require 'capistrano_ec2_role'

set :ec2_deploy_tag_name, 'role' # default is 'role'
set :aws_access_key_id, '...'
set :aws_secret_access_key, '...'
set :aws_region, '...'

ec2_role :web, 'web'
ec2_role :app, 'app'
ec2_role :db, 'db', primary: true
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/capistrano_ec2_role/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
