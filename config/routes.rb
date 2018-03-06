Rails.application.routes.draw do
  resources :users, only: [:create, :show, :new, :index]
  resources :places, only: [:new, :create, :show, :index]

  get '/', to: 'static#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/home/:id', to: 'users#home'
  post '/home/:id', to: 'places#create'
  # get '/users/signup', to: 'users#new'

end
