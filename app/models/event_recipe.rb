class EventRecipe < ApplicationRecord
    belongs_to :event
    belongs_to :recipe
end
