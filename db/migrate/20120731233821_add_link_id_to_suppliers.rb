class AddLinkIdToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :link_id, :integer
  end
end
