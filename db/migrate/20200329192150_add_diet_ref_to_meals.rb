class AddDietRefToMeals < ActiveRecord::Migration[6.0]
  def change
    add_reference :meals, :diet, null: false, foreign_key: { on_delete: :cascade }
  end
end
