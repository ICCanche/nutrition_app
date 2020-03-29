class AddCustomerRefToDiets < ActiveRecord::Migration[6.0]
  def change
    add_reference :diets, :customer, null: false, foreign_key: { on_delete: :cascade }
  end
end
