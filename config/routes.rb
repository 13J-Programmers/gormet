Rails.application.routes.draw do
  devise_for :users
  root 'application#index'

  resources :foods
  resources :menus
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
