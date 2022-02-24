Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root to: "users#index"
  resources :items, only: [:index, :show]
end
