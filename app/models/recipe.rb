class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :event_recipes
    has_many :ingredients, through: :recipe_ingredients
    has_many :events, through: :event_recipes
end
