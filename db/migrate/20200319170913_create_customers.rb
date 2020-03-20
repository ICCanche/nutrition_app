class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :gender
      t.integer :age
      t.string :occupation
      t.decimal :weight
      t.decimal :height
      t.decimal :imc, precision: 10, scale: 2
      t.integer :daily_foods
      t.string :disease

      t.timestamps
    end
  end
end
