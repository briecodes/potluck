class Event < ApplicationRecord
    has_many :user_events
    has_many :event_recipes
    has_many :users, through: :user_events
    has_many :recipes, through: :event_recipes
    has_many :ingredients, through: :recipes
end
