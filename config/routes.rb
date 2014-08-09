Rails.application.routes.draw do

  get '/', to: 'users#welcome'
  get '/signin', to: 'user_sessions#new'

  resources :user_sessions
  resources :users
end
