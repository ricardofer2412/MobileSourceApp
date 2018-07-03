Rails.application.routes.draw do



  resources :unlocks
  resources :accounts
  devise_for :users
  resources :orders
  resources :balances




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'accounts#index'
  post 'fetch_account_info' => 'accounts#fetch_account_info', as: :fetch_account_info
  post 'fetch_acccount_balance' => 'accounts#fetch_acccount_balance', as: :fetch_acccount_balance
  post 'fetch_all_balance' => 'accounts#fetch_all_balance', as: :fetch_all_balance
  post '/accounts/:id' => 'accounts#fetch_single_balance', as: :fetch_single_balance
  post '/accounts/:id' => 'account#fetch_account', as: :fetch_account

  put '/balances', to: 'balances#get_balance', as: 'get_balance'




end
