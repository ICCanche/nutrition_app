class AddJoinTablePhysicalActivityCustomer < ActiveRecord::Migration[6.0]
  def change
    create_join_table :physical_activities, :customers do |t|
      t.index [:physical_activity_id, :customer_id], name: "index_customers_excersise_on_excersise_id_and_customer_id"
    end
  end
end
