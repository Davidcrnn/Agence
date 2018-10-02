Rails.application.routes.draw do
  get 'pictures/detroy'
  get 'images/destroy'
  # devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  resources :rentals
  resources :sales
  resources :contacts, only: [:new, :create]
  resources :images, only: [:destroy]
  #resources :pictures, only: [:destroy]
  resources :estimations, only: [:new, :create]
  get '/mentions' => 'pages#mention'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
