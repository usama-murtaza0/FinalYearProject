Rails.application.routes.draw do
  
  get 'charges/new'
  get 'charges/create'
  get 'carts/show'
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  get "home/index"  

  resources :categories do
    member do 
      get :products
    end
  end
  
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

  resources :products do
    collection do
      get :search
    end
  end

  resources :charges, only: [:new, :create]
  
  root to: "home#index"  

end
