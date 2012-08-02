class RemoveSupplierIdFromComponents < ActiveRecord::Migration
  def up
    remove_column :components, :supplier_id
      end

  def down
    add_column :components, :supplier_id, :integer
  end
end
