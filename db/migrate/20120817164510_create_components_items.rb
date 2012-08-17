class CreateComponentsItems < ActiveRecord::Migration
  def change
    create_table :components_items do |t|
      t.integer :component_id
      t.integer :item_id

      t.timestamps
    end
  end
end
