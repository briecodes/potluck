class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :event_recipes
  has_many :events, through: :event_recipes
  validates :name, presence: true
  validates :details, presence: true
end
