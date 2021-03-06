Rails.application.routes.draw do
  root 'home#index'
  resources :memberships
  resources :games, only: %i[index show] do
    resources :reviews
  end
  resources :borrowings, only: %i[new create index show]
  devise_for :users

  namespace :admin do
    resources :tags
    resources :borrowings
    resources :games do
      resources :reviews, except: %i[new create]
    end
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
