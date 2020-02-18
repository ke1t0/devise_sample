Rails.application.routes.draw do
  get 'relationships/ceate'

  get 'relationships/destroy'

  get 'relationsips/create'

  get 'relationsips/destroy'

  # get 'home/index'
  # get 'home/show'
  root 'home#index'
  devise_for :users
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
end
