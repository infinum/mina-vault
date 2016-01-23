# # Modules: Vault
# Adds settings and tasks for managing Vault workers.
#
# ## Usage example
#     require 'mina/vault'
#
#     task :deploy do
#       deploy do
#         invoke :'git:clone'
#         invoke :'vault:read'
#         ...
#
#       end
#     end

require 'mina/bundler'
require 'mina/rails'

# ## Settings
# Any and all of these settings can be overriden in your `deploy.rb`.

# ### vault
# Sets the path to vault.
set_default :mina_vault_token, -> { ENV['MINA_VAULT_TOKEN'] }

# ### vault_pid_dir
# Sets the dir to the pid files of a vault workers
set_default :mina_vault_auth_method, -> { ENV['MINA_VAULT_AUTH_METHOD'] || 'token' }

# ## Control Tasks
namespace :vault do
  # ### vault:auth
  desc 'Vault auth'
  task auth: :environment do
    queue %(echo "-----> Vault auth")
    queue %(#{vault_auth_cmd})
  end

  # ### vault:read
  desc 'vault read'
  task read: :auth do
    queue %(echo "-----> Vault read")
    queue %(#{vault_read_cmd})
  end
end
