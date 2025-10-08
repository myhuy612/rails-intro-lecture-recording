Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # GET localhost:3000/about
  root to: "pages#about"

  # GET localhost:3000/contact
  get "/contact", to: "pages#contact"

  # GET localhost:3000/restaurants
  get "/restaurants", to: "restaurants#index"

  # GET localhost:3000/restaurants/4
  get "/restaurants/:id", to "restaurants#show"
end
