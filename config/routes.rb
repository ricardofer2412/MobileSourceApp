Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :orders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: redirect('/admin')
end
