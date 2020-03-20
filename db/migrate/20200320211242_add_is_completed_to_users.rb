class AddIsCompletedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_completed, :boolean, default: false
  end
end
