Rails.application.routes.draw do
  get 'searches/user'
  get 'searches/tweet'

  # get 'home/index'
  # get 'home/show'
  root 'home#index'
  devise_for :users
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :rooms, only: [:create, :show, :index]
end
  