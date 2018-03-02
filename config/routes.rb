Rails.application.routes.draw do

  resources :h2o_customers
  resources :h2o_re_ups
  devise_for :users
  resources :orders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'orders#index'
end
