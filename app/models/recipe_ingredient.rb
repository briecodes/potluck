class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  def self.most_used_ingredient
    ing_hash = RecipeIngredient.group(:ingredient_id).order('ingredient_id ASC').count(:id).sort_by {|k,v| v}.reverse
    ing_hash.map do |ingredient_id, value|
      Ingredient.find(ingredient_id).name.gsub(/[\r\n\\]/, "").gsub("\"", "").gsub("\\", "")
    end
  end
end
