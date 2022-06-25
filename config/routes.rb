require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
      get '/user/transactions_to_chart', to: 'users#transactions_by_category_to_chart'
      post '/user/set_quota', to: 'users#set_quota'
      resources :transactions, only: [:index, :show]
      post '/transactions/:id/add_category/:category_id', to: 'transactions#add_to_category'
      post '/transactions/:id/remove_category/:category_id', to: 'transactions#remove_category'

      get '/categories', to: 'transaction_categories#index'
      post '/categories', to: 'transaction_categories#create'

      post '/fintoc_accounts', to: 'fintoc_accounts#create'
      post '/buda_accounts', to: 'buda_accounts#create'
      post '/fintual_accounts', to: 'fintual_accounts#create'

      get '/to_buy_lists', to: 'to_buy_lists#index'
      get '/to_buy_lists/:id', to: 'to_buy_lists#show'
      delete '/to_buy_lists/:id', to: 'to_buy_lists#delete'

      post '/to_buy_lists', to: 'to_buy_lists#create'
      post '/to_buy_lists/:id/item', to: 'to_buy_items#create'
      delete '/to_buy_lists/:id/item/:item_id', to: 'to_buy_items#delete'
    end
  end
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Ui::Engine, at: "/", as: 'root'
  authenticate :admin_user do
    mount Sidekiq::Web => '/admin/jobs'
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
