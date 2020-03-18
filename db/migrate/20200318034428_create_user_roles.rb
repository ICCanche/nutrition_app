class CreateUserRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_roles do |t|
      t.string :roleType
      t.string :name

      t.timestamps
    end
  end
end
