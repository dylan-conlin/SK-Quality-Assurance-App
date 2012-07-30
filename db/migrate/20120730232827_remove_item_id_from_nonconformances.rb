class RemoveItemIdFromNonconformances < ActiveRecord::Migration
  def up
    remove_column :nonconformances, :item_id
      end

  def down
    add_column :nonconformances, :item_id, :integer
  end
end
