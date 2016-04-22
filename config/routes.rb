Rails.application.routes.draw do
  root to: "artists#index"

  resources :artists
  resources :songs

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get  "/signin" => "sessions#new"
  post "/signin" => "sessions#create"
  get  "/signout" => "sessions#destroy"
end
