class Recipe < ApplicationRecord
  has_many :event_recipes
  has_many :events, through: :event_recipes
  belongs_to :user
end
