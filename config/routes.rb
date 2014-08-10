Rails.application.routes.draw do

  get '/', to: 'users#index'
  get '/login', to: 'user_sessions#new', as: :login
  get '/logout', to: 'user_sessions#destroy'
  get '/register', to: 'users#new'
  # get '/user_sessions', to: 'user_sessions#create', as: :user_sessions

  resources :user_sessions
  resources :users
end
