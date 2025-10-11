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

    # READ ALL
  # GET localhost:3000/restaurants
  get "/restaurants", to: "restaurants#index"

    # CREATE
  # GET localhost:3000/restaurants/new
  # must be before the "/restaurants/:id"
  get "/restaurants/new", to: "restaurants#new"

  # POST localhost:3000/restaurants/create
  post "restaurants", to: "restaurants#create"

    # READ ONE
  # GET localhost:3000/restaurants/4
  get "/restaurants/:id", to: "restaurants#show", as: "restaurant"

    # UPDATE
  # GET localhost:3000/restaurants/4/edit
  get "/restaurants/:id/edit", to: "restaurants#edit"

  # PATCH is for editing an existing field
  patch "restaurants/:id", to: "restaurants#update"

    # DELETE
  # DELETE localhost:3000/:id
  delete "restaurants/:id", to: "restaurants#destroy"

    # create all methods for model of CRUD (create, read, update, delete) in one line
  #resources :restaurants
  # resources :restaurants, except: [:index, :show] # specify the unwated methods
  # resources :restaurants, only: [:index, :show] # specify the wanted methods
end
