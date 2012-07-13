class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.integer :nonconformance_id
      t.integer :user_id
      t.string :workorder
      t.string :lot
      t.string :sublot
      t.integer :quantity
      t.string :units
      t.string :location
      t.integer :labor
      t.string :labor_units
      t.string :user_id

      t.timestamps
    end
  end
end
