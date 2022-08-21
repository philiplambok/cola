require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :randoms, only: %i[index]
  resources :resets, only: %i[index]
  resources :accounts, only: %i[show]

  root 'home#index'
end
