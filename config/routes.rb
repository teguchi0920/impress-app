Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'books#index'
  resources :books do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end
end
