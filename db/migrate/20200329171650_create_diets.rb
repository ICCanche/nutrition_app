class CreateDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.string :name
      t.integer :price, null: false
      t.integer :status, default: 0
      t.text :recommendations
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
