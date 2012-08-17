class AddComponentsItemsIdToComponents < ActiveRecord::Migration
  def change
    add_column :components, :components_items_id, :integer
  end
end
