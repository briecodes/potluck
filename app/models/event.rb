class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  has_many :event_recipes
  has_many :recipes, through: :event_recipes

  validates(:title, {presence: true, uniqueness: true, length: {maximum: 20}})
  validates(:location, {presence: true, length: {maximum: 100}})
  validates(:date, {presence: true})
  validates(:details, {length: { maximum: 1000 }})
end
