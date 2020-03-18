class CreatePhysicalActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :physical_activities do |t|
      t.string :name

      t.timestamps
    end
  end
end