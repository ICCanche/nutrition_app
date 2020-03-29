class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :content
      t.integer :weekday

      t.timestamps
    end
  end
end
