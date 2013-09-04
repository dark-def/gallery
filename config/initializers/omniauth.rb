require 'yaml'
Rails.application.config.middleware.use OmniAuth::Builder do
  API_KEYS = YAML.load_file('config/environments/development.yml')
  provider :facebook, API_KEYS['API_KEYS']['facebook']['key'], API_KEYS['API_KEYS']['facebook']['secret']
end
