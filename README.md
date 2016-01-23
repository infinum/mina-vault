# Modules: Vault

Mina plugin to manage vaults

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mina-vault', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina-vault

## Usage

### Settings
Any and all of these settings can be overriden in your `deploy.rb`.

Sets the path to vault.

    set_default :vault, lambda { "bin/vault" }

Sets the dir to the pid files of a vault workers

    set_default :vault_pid_dir, lambda { "#{deploy_to}/#{shared_path}/pids" }

Sets the number of vault processes launched

    set_default :vault_processes, 1

### Usage example

    require 'mina/vault'
    ...
    task :setup do
      # vault needs a place to store its pid file
      invoke :'vault:setup'
    end

    task :deploy do
      deploy do
        invoke :'git:clone'
        ...

        to :launch do
          ...
          invoke :'vault:restart'
        end
      end
    end

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mina-vault/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
