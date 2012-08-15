class CreateWasteCaptures < ActiveRecord::Migration
  def change
    create_table :waste_captures do |t|
      t.integer :user_id
      t.integer :component_id
      t.string :workorder
      t.decimal :quantity

      t.timestamps
    end
  end
end
