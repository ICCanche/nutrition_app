class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :gender
      t.integer :age
      t.string :occupation
      t.decimal :weight
      t.decimal :height
      t.decimal :imc
      t.integer :daily_foods
      t.string :disease
      t.boolean :is_completed, default: false

      t.timestamps
    end
  end
end
