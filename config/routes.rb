Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'photos#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :photos
  resources :comments



  resources :likes, only: [:create]

end
