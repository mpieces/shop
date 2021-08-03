Rails.application.routes.draw do
  resources :charges, only: [:new, :create, :index]
  post '/card' => 'charges#create', as: :create_payment_method
  get '/success' => 'charges#success', as: :success 
  # get 'charges/new' => 'charges#new'
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy 
    
  end
  
  resources :users
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
