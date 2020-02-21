class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :first_name
      t.string :last_name
      t.string :uid
      t.string :profile_picture

      t.timestamps
    end
  end
end
