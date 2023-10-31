Rails.application.routes.draw do

  #devise_for :users
  # Routes for integrated react without gems. Webpacker takes a lot of time to recompile at each modif ( 3min ...)
  #get 'spa/index'
  #get 'app', to: 'spa#index'
  #get 'app/*path', to: 'spa#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root 'games#index'


  # resources :games, except: [:index]
  # resources :characters
  # resources :users

  namespace :api do
    namespace :v1 do
      resources :users
      post '/users/connect', to: 'users#connect'
      resources :games
      resources :characters
    end
  end




end
