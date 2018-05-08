class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  has_many :event_recipes
  has_many :recipes, through: :event_recipes

  validates(:title, {presence: true, uniqueness: true})
  validates(:location, {presence: true})
  validates(:date, {presence: true})
end
