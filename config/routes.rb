# config/routes.rb
Rails.application.routes.draw do
  root 'sessions#index'
  resources :goodgymers, only: [:index, :show, :create]
  resources :sessions, only: [:index, :show, :create]
  resources :registrations, only: [:create]
  resources :pairings, only: [:create]
end
