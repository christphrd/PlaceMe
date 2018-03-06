Rails.application.routes.draw do
  resources :users, only: [:create, :show, :new]
  
  get '/', to: 'static#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # get '/users/signup', to: 'users#new'

end
