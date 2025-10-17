Rails.application.routes.draw do
  # Health check (keep it)
  get "up" => "rails/health#show", as: :rails_health_check

  # Root page
  root "posts#index"

  # RESTful routes
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # Friendly named routes
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  
end
