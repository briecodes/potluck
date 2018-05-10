class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :event_recipes
  has_many :events, through: :event_recipes
  validates :name, presence: true
  validates :details, presence: true

  def max_count(arr)
    arr.uniq.map { |n| arr.count(n) }.max
  end

  def self.most_used_ingredient
    @mosty = []
    Recipe.all.map do |r|
      @mosty << r.ingredients.ids
    end
  end
end
