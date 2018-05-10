class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :event_recipes
  has_many :events, through: :event_recipes
  validates :name, presence: true
  validates :details, presence: true

  def self.popular
    recipes_times_used = Hash.new
    Recipe.all.each do |r|
      recipes_times_used[r.name] = r.events.size
    end
    recipes_times_used = recipes_times_used.sort_by {|k, v| v}
    recipes_times_used.to_a[-1][0]
  end

  def self.most_ingredients
    number_of_ings = Hash.new
    Recipe.all.each do |r|
      number_of_ings[r.name] = r.ingredients.size
    end
    number_of_ings = number_of_ings.sort_by {|k, v| v}
    number_of_ings.to_a[-1][0]
  end
end
