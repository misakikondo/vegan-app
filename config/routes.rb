Rails.application.routes.draw do
  get 'product/search'
  devise_for :users
  root to: 'top#index'
  get "recipes/search"
  resources :donates, only: [:index, :create]
  resources :users, only: :show
  resources :recipes do
    resources :comments, only: :create
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
