class AddItemIdToComponents < ActiveRecord::Migration
  def change
    add_column :components, :item_id, :integer
  end
end
