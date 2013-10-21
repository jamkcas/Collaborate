Collaborate::Application.routes.draw do

  resources :users, except: [:index]
  resources :sessions, only: [:new, :create]

  # post '/users/:id' => 'users#update'
  get '/logout' => 'sessions#destroy'

end
