class User < ApplicationRecord
  has_many :user_events
  has_many :events, through: :user_events
  has_many :recipes
  
  validats :username, uniqueness: true
end
