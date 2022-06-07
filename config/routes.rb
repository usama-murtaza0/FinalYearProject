Rails.application.routes.draw do

  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  
  get 'carts/show'
  
  get 'users/index'
  
  get 'products/index'
  
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  
  get 'reviews/index'
  get 'reviews/show'

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  get "home/index"  

  resources :categories
  resources :reviews
  resources :orders
  devise_for :users

  resources :users do
    member do
      post :deactivate
      post :activate
      get :products
      get :orders
    end
  end

  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root to: "products#index"
  root to: "home#index"  
end
