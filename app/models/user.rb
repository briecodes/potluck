class User < ApplicationRecord
  has_many :user_events
  has_many :events, through: :user_events
  has_many :user_recipes
  has_many :recipes, through: :user_recipes
  
  validats :username, uniqueness: true
end
