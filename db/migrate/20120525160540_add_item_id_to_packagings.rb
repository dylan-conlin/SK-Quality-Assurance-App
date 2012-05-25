class AddItemIdToPackagings < ActiveRecord::Migration
  def change
    add_column :packagings, :item_id, :integer
  end
end
