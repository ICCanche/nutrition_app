class AddCanRequestDietToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :can_request_diet, :boolean, default: true
  end
end
