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
        byebug
        event_recipe = EventRecipe.find_by(event_id: params[:e_id], recipe_id: params[:r_id])
        byebug
    end

    private
        def eventrecipe_params
            params.require(:event_recipe).permit(:event_id, recipe_id:[])
        end
end