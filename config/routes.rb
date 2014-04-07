Hubble::Application.routes.draw do
  root 'events#index'

  resources :events
  resources :users, only: [:new, :create]

  end
end
