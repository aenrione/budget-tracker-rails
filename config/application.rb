require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)
if['development', 'test'].include? ENV['RAILS_ENV']
  Dotenv::Railtie.load
end

require 'active_model_serializers'

module BudgetTrackerRails
  class Application < Rails::Application
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 headers: :any,
                 expose: ['X-Page', 'X-PageTotal', 'client', 'uid',
                          'access-token', 'token-type', 'expiry'],
                 methods: [:get, :post, :delete, :put, :options]
      end
    end

    config.i18n.fallbacks = [:es, :en]
    config.i18n.default_locale = 'es-CL'
    config.assets.paths << Rails.root.join('node_modules')
    config.load_defaults 6.0
  end
end
