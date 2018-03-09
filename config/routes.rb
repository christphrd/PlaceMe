Rails.application.routes.draw do
  resources :users, only: [:create, :show, :new, :index, :edit, :update]
  resources :places, only: [:new, :create, :show, :index, :edit, :destroy]
  resources :comments, only: [:new, :create]
  get '/', to: 'static#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/home/:id', to: 'users#home'
  post '/home/:id', to: 'places#create'

  post '/places/:id', to: 'places#update'
  # get '/users/signup', to: 'users#new'
  # post '/places/:id', to: 'comments#new'
  get '/search', to: 'search#search'
end
