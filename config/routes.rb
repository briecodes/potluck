Rails.application.routes.draw do
  resources :events
  resources :ingredients
  resources :recipes
  resources :users, only: [:index, :create, :show, :edit, :update]

  get '/login', to: 'sessions#new', as: "login"
  get "/signup", to: "users#new", as: "signup"
  post "/sessions", to: "sessions#create", as: "sessions"
  post "/logout", to: "sessions#destroy", as: "logout"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
