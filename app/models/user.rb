class User < ApplicationRecord
  has_secure_password

  has_many :recipes
  has_many :user_events
  has_many :events, through: :user_events

  validates :username, uniqueness: true
  validates :username, format: { without: /\s/ }
  validates :name, presence: true

  def self.user_total
    User.all.size
  end

  def self.user_most_recipes
    list = User.all.select do |user|
      user.recipes
    end.sort {|a,b| b.recipes.size <=> a.recipes.size }.first.name
  end

  def self.user_recipe_average
    Recipe.all.size / User.all.size
  end

  def self.social_butterfly
    @popular_person = User.all.sort do |a,b|
      b.events.size <=> a.events.size
    end.first.name
  end
end
