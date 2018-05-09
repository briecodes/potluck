class EventRecipesController < ApplicationController
    
    def new
        byebug
        EventRecipe.create(eventrecipe_params)
        redirect_to event_path(params[:event_recipe][:event_id])
    end

    private
        def eventrecipe_params
            params.require(:event_recipe).permit(:event_id, recipe_ids:[])
        end
end