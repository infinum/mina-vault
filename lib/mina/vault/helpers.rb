def vault_auth_cmd
  'vault auth' + method_options
end

def vault_read_cmd
  "vault read -field=#{mina_vault_secrets_field} #{secrets_key}"
end

private

def method_options
  return mina_vault_auth_options unless mina_vault_auth_options.nil?
  die('mina_vault_token is not set') if mina_vault_token.nil?
  case mina_vault_auth_method
  when 'token'
    " #{mina_vault_token}"
  when 'github'
    " -method=github token=#{mina_vault_token}"
  end
end

def vault_repo
  return mina_vault_repo unless mina_vault_repo.nil?
  repository.match(%r{\/(.*)\..*})[1]
end

def secrets_key
  return mina_vault_secrets_key unless mina_vault_secrets_key.nil?
  "rails/#{rails_env}/#{vault_repo}"
end
