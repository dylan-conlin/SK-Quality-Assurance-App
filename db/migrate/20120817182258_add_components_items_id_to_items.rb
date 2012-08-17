class AddComponentsItemsIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :components_items_id, :integer
  end
end
