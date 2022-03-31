Rails.application.routes.draw do
  root 'home#index'
  resources :memberships
  resources :games, only: %i[index show]
  resources :borrowings, only: %i[new create index show]
  devise_for :users

  namespace :admin do
    # The controllers that will be called are the ones in app/controllers/admin directory

    resources :games
    resources :borrowings
    resources :users, except: %i[new create] do
      patch 'ban', on: :member
    end
  end

  # This next line is not even necessary because all this work is managed by devise.
  # resources :users, except: %i[new index create] # Here I should remove GET /users, GET users/new, POST /users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
