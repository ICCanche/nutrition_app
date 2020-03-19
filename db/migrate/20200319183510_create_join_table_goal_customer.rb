class CreateJoinTableGoalCustomer < ActiveRecord::Migration[6.0]
  def change
    create_join_table :goals, :customers do |t|
      t.index [:customer_id, :goal_id]
    end
  end
end
