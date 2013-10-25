Collaborate::Application.routes.draw do
  root to: 'sessions#index'

  resources :users, except: [:index]
  resources :sessions, only: [:index, :new, :create, :destroy]
  resources :projects
  resources :skills

  get '/logout' => 'sessions#destroy'
  get '/my_posts' => 'users#my_posts', as: 'my_posts'

end
