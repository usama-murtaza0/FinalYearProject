Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  get 'categories/create'
  get 'categories/edit'
  get 'categories/update'
  get 'categories/destroy'
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/update'
  get 'reviews/destroy'
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  get 'users/index'
  get 'products/index'
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  resources :orders
  devise_for :users
  resources :users do
    member do
      get :products
    end
  end

  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "products#index"
end
