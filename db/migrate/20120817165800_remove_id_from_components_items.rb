class RemoveIdFromComponentsItems < ActiveRecord::Migration
  def up
    remove_column :components_items, :id
      end

  def down
    add_column :components_items, :id, :integer
  end
end
