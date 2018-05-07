class User < ApplicationRecord
    has_many :recipes
    has_many :user_events
    has_many :ingredients, through: :recipes
    has_many :events, through: :user_events
end
