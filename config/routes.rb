Rails.application.routes.draw do

  resources :accounts
  devise_for :users
  resources :orders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'orders#index'
  post 'fetch_balance' => 'accounts#fetch_balance', as: :fetch_balance
  post 'fetch_new' => 'accounts#fetch_new', as: :fetch_new

end
