Rails.application.routes.draw do
  resources :events
  resources :ingredients
  resources :recipes
  resources :users, only: [:index, :create, :show, :edit, :update]

  get '/login', to: 'sessions#new', as: "log_in"
  get "/signup", to: "users#new", as: "sign_up"
  post "/sessions", to: "sessions#create", as: "sessions"
  post "/logout", to: "sessions#destroy", as: "log_out"

  # For details on the DSL available within this file, see http://gu vbides.rubyonrails.org/routing.html
end
