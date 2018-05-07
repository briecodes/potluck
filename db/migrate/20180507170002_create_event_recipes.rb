class CreateEventRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :event_recipes do |t|
      t.integer :recipe_id
      t.integer :event_id

      t.timestamps
    end
  end
end
