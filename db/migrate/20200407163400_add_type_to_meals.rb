class AddTypeToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :meal_type, :integer, required: true
  end
end
