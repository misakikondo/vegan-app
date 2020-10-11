Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  get "recipes/search"
  resources :users, only: :show
  resources :recipes do
    resources :comments, only: :create
    # resources :likes, only: [:create,:destroy]
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
