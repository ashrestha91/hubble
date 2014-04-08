Hubble::Application.routes.draw do
  root 'events#index'

  resources :events

  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:new, :create]
  get "/login", to: 'sessions#new'
  get "/logout", to: 'sessions#destroy'
end
