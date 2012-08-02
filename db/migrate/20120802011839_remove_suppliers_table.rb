class RemoveSuppliersTable < ActiveRecord::Migration
  def up
    drop_table :suppliers
  end

  def down
    create_table :suppliers
  end
end
