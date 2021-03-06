class EventRecipesController < ApplicationController
  def new
    eventrecipe_params[:recipe_id].each do |r_id|
      if r_id
        EventRecipe.create(recipe_id: r_id, event_id: eventrecipe_params[:event_id])
      end
    end

    redirect_to event_path(params[:event_recipe][:event_id])
  end

  def destroy
    event_recipe = EventRecipe.where(event_id: params[:e_id], recipe_id: params[:d_id]).first
    event_recipe.destroy
    redirect_to event_path(params[:e_id])
  end

  private

  def eventrecipe_params
    params.require(:event_recipe).permit(:event_id, recipe_id:[])
  end
end
