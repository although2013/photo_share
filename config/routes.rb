Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'photos#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :photos
  resources :comments

  post '/like',   to: 'likes#like',   as: 'like'
  post '/unlike', to: 'likes#unlike', as: 'unlike'

end
