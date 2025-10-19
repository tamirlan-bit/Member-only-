Rails.application.routes.draw do
  # Health check (keep it)
  get "up" => "rails/health#show", as: :rails_health_check

  # Root page
  root "posts#index"

  # Add Devise routes for authentication
  devise_for :users

  # RESTful routes
  resources :posts do
    resources :comments, only: [ :create, :destroy ]
  end
end
