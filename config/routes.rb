Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  post '/login', to: 'users#login'
  get '/registration', to: 'users#new'

  resources :dashboard
  resources :users, only: [:new, :create]
  resources :discover, only: :index
end
