Rails.application.routes.draw do

  resources :accounts
  devise_for :users
  resources :orders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'orders#index'
  post 'fetch_account_info' => 'accounts#fetch_account_info', as: :fetch_account_info
  post 'fetch_acccount_balance' => 'accounts#fetch_acccount_balance', as: :fetch_acccount_balance
  post 'fetch_all_balance' => 'accounts#fetch_all_balance', as: :fetch_all_balance


end
