class DropComponentsItemsTable < ActiveRecord::Migration
  def up
    drop_table :components_items
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
