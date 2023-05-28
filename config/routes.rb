Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'books#index'
  resources :books do
    resources :comments
  end
end
