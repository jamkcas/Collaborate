Collaborate::Application.routes.draw do
  root to: 'sessions#index'

  # get '/' => 'home#index'
  resources :users, except: [:index]
  resources :sessions, only: [:index, :new, :create, :destroy]
  resources :projects

  get '/logout' => 'sessions#destroy'


end
