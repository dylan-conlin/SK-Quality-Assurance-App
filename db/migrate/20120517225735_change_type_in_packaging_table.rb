class ChangeTypeInPackagingTable < ActiveRecord::Migration
  def up
    change_column :packagings, :workorder, :string
    change_column :packagings, :item_number, :string
  end

  def down
    change_column :packagings, :workorder, :integer
    change_column :packagings, :item_number, :integer
  end
end
