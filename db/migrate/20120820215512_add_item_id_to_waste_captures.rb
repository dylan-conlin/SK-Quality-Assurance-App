class AddItemIdToWasteCaptures < ActiveRecord::Migration
  def change
    add_column :waste_captures, :item_id, :integer
  end
end
