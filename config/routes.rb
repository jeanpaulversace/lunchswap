Rails.application.routes.draw do

  get '/', to: 'users#index'
  get '/login', to: 'user_sessions#new', as: :login
  get '/logout', to: 'user_sessions#destroy'
  get '/register', to: 'users#new'
  post '/user_sessions/:id', to: 'foods#add_food'
  post '/update_location', to: 'user_sessions#update_location'
  post '/user_sessions/request', to: 'foods#add_request'

  resources :user_sessions
  resources :users
end
