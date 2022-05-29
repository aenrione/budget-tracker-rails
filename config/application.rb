require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)
Dotenv.load


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
