Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get '/registration', to: 'users#new'

  resources :dashboard
  resources :users, only: [:new, :create]
  resources :discover, only: :index
  resources :movies, only: [:index, :show]
  resources :friendships, only: :create
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
