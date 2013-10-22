Collaborate::Application.routes.draw do
  root to: 'home#index'

  get '/' => 'home#index'
  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :projects

  get '/logout' => 'sessions#destroy'


end
