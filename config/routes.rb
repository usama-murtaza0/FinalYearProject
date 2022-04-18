Rails.application.routes.draw do
  get 'users/index'
  get 'products/index'
  devise_for :users
  resources :users
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "products#index"
end
