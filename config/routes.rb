Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  namespace :admin do
    # The controllers that will be called are the ones in app/controllers/admin directory
    resources :users
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
