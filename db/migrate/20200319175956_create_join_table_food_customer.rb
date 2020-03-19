class CreateJoinTableFoodCustomer < ActiveRecord::Migration[6.0]
  def change
    create_join_table :foods, :customers do |t|
      t.index [:food_id, :customer_id]
    end
  end
end
