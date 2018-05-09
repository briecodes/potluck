class RecipesController < ApplicationController
  before_action :get_recipe, only: [:show, :edit, :update, :destroy]
  def index
    @recipes = Recipe.all
  end
  def show

  end
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @ingredients = Ingredient.all
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = session[:user_id]
    if @recipe.save
      current_user.recipes << @recipe
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end
  private
  def recipe_params
    params.require(:recipe).permit(:name, :details, :user_id, ingredient_ids:[])
  end
  def get_recipe
    @recipe = Recipe.find(params[:id])
  end
end
