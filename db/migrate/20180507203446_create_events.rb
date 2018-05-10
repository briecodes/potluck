class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :date
      t.string :timeconvention
      t.string :details

      t.timestamps
    end
  end
end
