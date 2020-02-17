class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.belongs_to :food_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
