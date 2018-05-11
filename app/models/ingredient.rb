class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true, uniqueness: true

  def self.num_of_ingredients
    Ingredient.all.count
  end
end
