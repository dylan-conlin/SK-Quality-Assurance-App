class DropItemComponentsTable < ActiveRecord::Migration
  def up
    drop_table :item_components
  end

  def down
  end
end
