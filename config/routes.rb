Rails.application.routes.draw do
  resources :game_tags
  resources :tags
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

  # Error handling
  get 'public/403', to: 'errors#error403', as: 'error403'
  get 'public/404', to: 'errors#error404', as: 'error404'
  get 'public/422', to: 'errors#error422', as: 'error422'
  get 'public/500', to: 'errors#error500', as: 'error500'
end
