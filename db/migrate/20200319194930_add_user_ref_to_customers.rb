class AddUserRefToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :user, null: false, foreign_key: { on_delete: :cascade }
  end
end
