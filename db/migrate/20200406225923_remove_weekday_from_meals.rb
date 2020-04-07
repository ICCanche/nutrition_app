class RemoveWeekdayFromMeals < ActiveRecord::Migration[6.0]
  def change

    remove_column :meals, :weekday, :integer
  end
end
