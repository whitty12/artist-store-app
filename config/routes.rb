Rails.application.routes.draw do
  #manual route
  #get "user/:id/profile", to: "user#profile"
  
  # Define our default resourceful routes
  resources :users 
  resource :cart do
    resources :cart_items, only: [:new, :create, :destroy]
  end
  resources :products
  resources :promotions
  resources :creators

  namespace :api do
    namespace :v1 do
      get '/users', to: 'users#index'
      get '/users/:id', to: 'users#show'
      get '/promotions', to: 'promotions#index'
      get '/promotions/:id', to: 'promotions#show'
      get '/products', to: 'products#index'
      get '/products/:id', to: 'products#show'
      get '/creators', to: 'creators#index'
      get '/creators/:id', to: 'creators#show'
      get '/cart', to: 'cart#show'
    end
  end



  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "products#index"
end
