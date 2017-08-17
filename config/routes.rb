Rails.application.routes.draw do
  root 'application#index'
  devise_for :users

  resources :foods
  resources :users
  resources :menus
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
