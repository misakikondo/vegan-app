Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :recipes do
    resources :comments, only: :create
  end
end
