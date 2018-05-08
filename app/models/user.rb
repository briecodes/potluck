class User < ApplicationRecord
<<<<<<< HEAD
  has_secure_password
  has_many :recipes
  has_many :user_events
  has_many :events, through: :user_events

  validates :username, uniqueness: true
=======
  has_many :user_events
  has_many :events, through: :user_events
  has_many :recipes
>>>>>>> master
end
