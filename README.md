# Modules: Vault

Mina plugin to work with [vault](https://vaultproject.io)

## Installing

    gem install mina-vault

Or add to Gemfile

    gem 'mina-vault', require: false


## Using

### Variables to override:

    mina_vault_auth_token    # default: ENV['MINA_VAULT_AUTH_TOKEN']
    mina_vault_auth_method   # default: ENV['MINA_VAULT_AUTH_METHOD'] || 'token'
    mina_vault_secrets_field # default: 'secrets'
    mina_vault_auth_options  # this will override aith_token and auth_method
    mina_vault_repo          # if not set, will use git repo name
    mina_vault_secrets_file  # this is mandatory
    mina_vault_secrets_key   # mandatory (Example 'rails/staging/repo')

### Deploying

Locally set:
get github token with repo:org permissions
set MINA_VAULT_AUTH_TOKEN=github_token
set MINA_VAULT_AUTH_METHOD=github

### Using with CI

set VAULT_TOKEN environment
set VAULT_ADDR environment

On BUILD: Add before bundle install:

    gem install vault-binaries
    vault read -field=#{secrets_field} #{secrets_key} > #{secrets_file}

On DEPLOY:

    mina staging deploy MINA_VAULT_AUTH_TOKEN=$VAULT_TOKEN

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mina-vault/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
