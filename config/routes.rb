Rails.application.routes.draw do
  #manual route
  #get "user/:id/profile", to: "user#profile"
  
  # Define our default resourceful routes
  resources :users do
    resource :cart_items
  end
  resources :products do
    resource :product_details
  end
  resources :promotions
  resources :creators


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/user", to: "user#index"
  get "/user/:id", to: "user#show" 
  get "/product", to: "product#index"
  get "/product/:id/product_details", to: "product_details#show"
  

  get "/creator", to: "creator#index"
  get "/creator/:id", to: "creator#show"
  get "user/:id/cart_items", to: "cart_items#index"
  get "/promotion", to: "promotion#index"
  get "/promotion/:id", to: "promotion#show"
  get "/product_type", to: "product_type#index"



  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
