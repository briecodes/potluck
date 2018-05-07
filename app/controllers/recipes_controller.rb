class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  def show
    @recipe = Recipe.find(params[:id])
  end
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def destroy

  end
  private
  def recipe_params
    params.require(:recipe).permit(:name, :details, :user_id)
  end
end
