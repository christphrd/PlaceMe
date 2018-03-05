Rails.application.routes.draw do
  resources :users, only: [:create, :show, :new]
  resources :sessions, only: [:create, :new]

  get '/', to: 'static#welcome'
  # get '/users/signup', to: 'users#new'

end
