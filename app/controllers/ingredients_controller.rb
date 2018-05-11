class IngredientsController < ApplicationController
  before_action :get_ingredient, only: [:show, :edit, :update]
  before_action :get_ingredients, only: [:index]

  def index
  end

  def show
    @user = current_user
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.valid?
      @ingredient.save
      flash[:success] = ["You successfully created an ingredient."]
      redirect_to new_ingredient_path
    else
      flash[:errors] = @ingredient.errors.full_messages
      redirect_to new_ingredient_path
    end
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to @ingredient
    else
      flash[:errors] = @ingredient.errors.full_messages
      redirect_to edit_ingredient_path(@ingredient)
    end
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def get_ingredients
    @ingredients = Ingredient.all
  end

  def get_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
