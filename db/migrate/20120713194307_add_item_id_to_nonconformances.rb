class AddItemIdToNonconformances < ActiveRecord::Migration
  def change
    add_column :nonconformances, :item_id, :integer
  end
end
