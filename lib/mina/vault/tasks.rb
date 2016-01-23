require 'mina/bundler'
require 'mina/rails'

# Any and all of these settings can be overriden in your `deploy.rb`.
set_default :mina_vault_token, -> { ENV['MINA_VAULT_TOKEN'] }
set_default :mina_vault_auth_method, -> { ENV['MINA_VAULT_AUTH_METHOD'] || 'token' }
set_default :mina_vault_secrets_field, -> { 'secrets' }
# mina_vault_auth_options
# mina_vault_repo
# mina_vault_secrets_file
# mina_vault_secrets_key

namespace :vault do
  set :term_mode, :pretty

  desc 'Vault auth'
  task auth: :environment do
    queue %(echo "-----> Vault auth")
    queue! %(#{vault_auth_cmd})
  end

  desc 'vault read'
  task read: :auth do
    queue %(echo "-----> Vault read")
    queue! %(#{vault_read_cmd} > #{deploy_to}/#{shared_path}/#{mina_vault_secrets_file})
  end
end
