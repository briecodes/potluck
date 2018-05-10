Rails.application.routes.draw do

  root 'sessions#welcome'

  resources :events
  resources :ingredients
  resources :recipes
  resources :users, only: [:index, :create, :show, :edit, :update]
  delete '/users/:id', to: 'users#destroy'
  get "/signup", to: "users#new", as: "sign_up"
  get '/login', to: 'sessions#new', as: "log_in"
  post "/sessions", to: "sessions#create", as: "sessions"
  post "/logout", to: "sessions#destroy", as: "log_out"
  post '/eventrecipes', to: "event_recipes#new"
  delete '/eventrecipes', to: "event_recipes#destroy"

  # For details on the DSL available within this file, see http://gu vbides.rubyonrails.org/routing.html

  #Special custom routes to join and/or leave event
  post "/events/:id/join", to: "events#join_event"
  post "/events/:id/leave", to: "events#leave_event"

end
