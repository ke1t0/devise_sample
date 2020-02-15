Rails.application.routes.draw do
  # get 'home/index'
  # get 'home/show'
  root 'home#index'
  devise_for :users
end
