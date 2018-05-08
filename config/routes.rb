Rails.application.routes.draw do
  #Events routes
  get "/events", to: "events#index", as: "events"
  get "/events/new", to: "events#new", as: "new_event"
  get "/events/:id", to: "events#show", as: "event"
  post "/events", to: "events#create"
  get "/events/:id/edit", to: "events#edit", as: "edit_event"
  patch "/events/:id", to: "events#update"
  delete "/events/:id", to: "events#destroy"

  #Special custom routes to join and/or leave event
  post "/events/:id/join", to: "events#join_event"
  post "/events/:id/leave", to: "events#leave_event"

  #User routes
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
end
