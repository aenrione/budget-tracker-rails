Rails.application.routes.draw do
  devise_for :fintual_accounts
  devise_for :buda_accounts
  devise_for :fintoc_accounts
  scope path: '/api' do
    api_version(module: 'Api::V1', path: { value: 'v1' }, defaults: { format: 'json' }) do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        token_validations: 'api/v1/devise_token_auth/token_validations'
      }
      get '/user', to: 'users#show'
      get '/user/capabilities', to: 'users#get_capabilities'
      get '/user/balance_to_chart', to: 'users#balance_to_chart'
      get '/transactions', to: 'transactions#index'

      get '/categories', to: 'transaction_categories#index'
      post '/categories', to: 'transaction_categories#create'

      post '/fintoc_accounts', to: 'fintoc_accounts#create'
      post '/buda_accounts', to: 'buda_accounts#create'
      post '/fintual_accounts', to: 'fintual_accounts#create'
    end
  end
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
