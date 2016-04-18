Rails.application.routes.draw do
  resources :users
  resources :links
  resources :sessions

  namespace :api do
    resources :links
  end

  get "/", to: "welcome#message", as: "root"

  get "signup", to: "users#new", as: "signup"

  get "login", to: "sessions#new", as: "login"

  get "logout", to: "sessions#destroy", as: "logout"

  get "api_key", to: "users#show_api", as: "api_key"

  get ":short_url", to: "redirect#process_url"
end
