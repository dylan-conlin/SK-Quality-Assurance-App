class CreateItemComponents < ActiveRecord::Migration
  def change
    create_table :item_components do |t|
      t.integer :item_id
      t.integer :subrecipe_id

      t.timestamps
    end
  end
end
